#include <stdio.h>
#include <ul_def.h>
#include <com_log.h>

#include "ipostag.h"
#include <bsl/deque.h>
#include <bsl/map.h>
#include <isegment.h>
#include <property.h>
#include <ul_func.h>
#include <stdint.h>
#include <pthread.h>

#define writelog(log_type,fmt, arg...) \
    do { \
        com_writelog(log_type, "[%s:%d]"fmt, __FILE__, __LINE__, ##arg); \
    } while (0)

static const int MAX_TERM_LENGTH = 1000; //一行数据最长的长度
static const int MAX_TERM_COUNT = 1024;   //一次分词的记录个数

typedef struct _term_info_t {
    char term[MAX_TERM_LENGTH]; //词
    u_int32 freq;               //词频
} term_info_t;

class term_freq_cmp {
    public:
        bool operator () (const term_info_t & term_freq_1, const term_info_t & term_freq_2) {
            return term_freq_1.freq > term_freq_2.freq;
        };
};

long long get_hash_key(char *name, const int len)
{
    //creat_sign_fs64 仅能接受 char * 
    if (NULL == name) {
        writelog(COMLOG_WARNING, "The name is NULL ! ");
        return -1;
    }
    u_int sign1 = 0;
    u_int sign2 = 0;
    long long key = 0;
    creat_sign_fs64(name, len, &sign1, &sign2);
    key = (long long) sign1 << 32 | sign2;      //考虑的性能问题，暂时考虑使用 移位 或 操作
    return key;
}

int insert_term(char *term, bsl::hashmap < long long, u_int32 > &term_hash,
        bsl::deque < term_info_t > &term_deq)
{
    int ret = 0;
    long long key = 0;
    u_int32 addr = 0;
    term_info_t tmp_term_info ;
    if (NULL == term) {
        ret = -1;
        goto GO_OUT;
    }
    if(' ' == term[0]) {
        goto GO_OUT;
    }

    key = get_hash_key(term, strlen(term));
    if (term_hash.get(key, &addr) == bsl::HASH_EXIST) {
        if (addr > term_deq.size()) {
            writelog(COMLOG_WARNING, "the addr in term_deq > term_deq.size() ");
            ret = -1;
            goto GO_OUT;
        }
        term_deq[addr].freq ++ ;
    } else {
        //memcpy(tmp_term_info.term,term,strlen(term));
        snprintf(tmp_term_info.term,sizeof(tmp_term_info.term),"%s",term);
        tmp_term_info.freq  = 1;
        addr = term_deq.size();
        term_deq.push_back(tmp_term_info);
        if (term_hash.set(key, addr) == -1) {
            writelog(COMLOG_WARNING, "insert the hash map fail!");
            ret = -1;
            goto GO_OUT;
        }
    }
    ret = 0;
GO_OUT:
    return ret;
}
int save_freq_file(bsl::deque < term_info_t > &term_deq, const char *file_name)
{
    FILE *freq_file = NULL;
    int ret = 0;
    unsigned long long sum = 0;
    if (NULL == file_name) {
        writelog(COMLOG_FATAL, "the freq file_name is NULL!");
        ret = -1;
        goto GO_OUT;
    }
    int deque_size = term_deq.size();
    if (0 == deque_size) {
        writelog(COMLOG_WARNING, "no freq words info in the deq!");
        ret = 0;
        goto GO_OUT;
    }
    freq_file = fopen(file_name, "w");
    if (NULL == freq_file) {
        writelog(COMLOG_FATAL, "open freq file %s fail !", file_name);
        ret = -1;
        goto GO_OUT;
    }
    std::sort(term_deq.begin(), term_deq.end(), term_freq_cmp());

    for (int i = 0; i < deque_size; i++) {
        sum += term_deq[i].freq;
    }
    for (int i = 0; i < deque_size; i++) {
        fprintf(freq_file, "%s\t%d\n", term_deq[i].term, term_deq[i].freq);
    }
GO_OUT:
    if (NULL != freq_file) {
        fclose(freq_file);
        freq_file = NULL;
    }
    return ret;
}

inline int word_seg(handle_t handle, const char *word, bsl::hashmap < long long, u_int32 > &term_hash,
        bsl::deque < term_info_t > &term_deq)
{
    //printf("#####%s",word);
    int ret = 0;
    int count = 0;
    //int sub_tokens_count = 0;
    //bool basic = false;
    //token_t sub_tokens[MAX_TERM_COUNT];
    token_t tokens[MAX_TERM_COUNT];
    char str[1024];

    if (0 == handle || NULL == word) {
        writelog(COMLOG_FATAL, "handle is %d or %x addr is NULL!", handle, word);
        ret = -1;
        goto GO_OUT;
    }
    count = seg_segment(handle, word, strlen(word), tokens, MAX_TERM_COUNT);
    tag_postag(tokens, count);
    for (int i = 0; i < count; i++) {
        snprintf(str, 1024, "%s\t%d", tokens[i].buffer, tokens[i].type);
        insert_term(str, term_hash, term_deq);
    }
    //memset (tokens,0,sizeof(tokens));
    ret = 0;
GO_OUT:
    return ret;
}
int main(int argc, char *argv[])
{
    bsl::hashmap < long long, u_int32 > term_hash;
    bsl::deque < term_info_t > term_deq;
    char buff[MAX_TERM_LENGTH] = {0};
    char term[MAX_TERM_LENGTH] = {0};
    long wordid = 0;

    if (argc<5){
        printf("usage : worddict_path inputfile outputfile\n");
        return -1;
    }
    dict_ptr_t dictPtr = seg_dict_open(argv[1]);
    if (0 == dictPtr) {
        writelog(COMLOG_FATAL, "word dict open fail ");
        return -1;
    }
    handle_t handle = 0;
    handle = seg_open(dictPtr, MAX_TERM_COUNT);
    if (0 == handle) {
        writelog(COMLOG_FATAL, "seg_open is faill !");

        return -1;
    }

    if(tag_open(argv[2])) {
        writelog(COMLOG_FATAL, "postag open fail !");
    }
    
    term_hash.create(9999999);
    FILE * fp = fopen(argv[3],"r");
    if (NULL == fp)
    {
        printf("open %s fail!",argv[3]);
        return -1;
    }
    while (fgets(buff,sizeof(buff),fp)) {
        sscanf(buff,"%s\t%lu\n",term,&wordid);
        //printf("%s-------------%u %s\n",term,wordid,buff);
        word_seg(handle,term,term_hash,term_deq);
        memset(term,0,sizeof(term));
        memset(buff,0,sizeof(buff));
    }
    save_freq_file(term_deq,argv[4]);
    tag_close();
    return 0;
}
