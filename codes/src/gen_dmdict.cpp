#include "stringutil.h"
#include "ul_log.h"
#include "ul_dictmatch.h"

#define UFSUTIL_STR_LEN 1024
using namespace ufs;

int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        fprintf(stderr, "\
        arg:\n\
        1: dict_path\n\
        2: mode\n\
        1: one column\n\
        2: two columns\n");
        return -1;
    }

    dm_dict_t *dict = dm_dict_create(50000000);
    if (dict == NULL)
    {
        fprintf(stderr, "dict is null\n");
        return -1;
    }

    fprintf(stderr, "begin to read data\n");

    int line_num = 0;

    while (true)
    {
        char str[UFSUTIL_STR_LEN] = "";
        if (fgets(str, UFSUTIL_STR_LEN, stdin) == NULL)
        {       
            break;    
        }       

        str_chomp(str);

        line_num ++;

        const char *segs[UFSUTIL_STR_LEN];
        int segnum = str_split(str, segs, UFSUTIL_STR_LEN, "\t");
        if (segnum != atoi(argv[2]))
        {       
            ul_writelog(UL_LOG_FATAL, "split cur_word_id.dat error [num: %d]", line_num);
            continue; 
        }       

        dm_lemma_t lm;
        char temp[64] = "";
        str_ncpy(temp, segs[0], 64);
        lm.pstr =  temp;
        lm.len = strlen(segs[0]);
        if (atoi(argv[2]) == 2)
            lm.prop = atoi(segs[1]);

        if (dm_seek_lemma(dict, lm.pstr, lm.len) != DM_LEMMA_NULL)
        {       
            ul_writelog(UL_LOG_WARNING, "same word in cur_word_id.dat [str: %s] [line: %d]", lm.pstr, line_num);
            continue;
        }       
        else    
        {
            if (dm_add_lemma(dict, &lm) < 0)    
            {       
                ul_writelog(UL_LOG_WARNING, "add dm error [str: %s] [line: %d]", lm.pstr, line_num);
                continue;
            }       
            ul_writelog(UL_LOG_DEBUG, "add dm succceful [str: %s] [line: %d]", lm.pstr, line_num);
        }
    }

    dm_binarydict_save(dict, argv[1]);

    return 0;
}
