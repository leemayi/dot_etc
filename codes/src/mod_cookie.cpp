/*
 * =====================================================================================
 *
 *       Filename:  test_qtdict_im.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  04/09/12 10:57:37
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  huangjian (), huangjian@baidu.com
 *   Organization:  
 *
 * =====================================================================================
 */
#include "Configure.h"
#include "stringutil.h"
#include "comlogplugin.h"
#include "ul_sign.h"
 
using namespace ufs;
//DECLARE_bool(enable_qt_im);
#define STE_LEN_S 10240

int main(int argc, char **argv)
{
    uint32_t uint_1, uint_2;
    uint64_t sign;
    char str[STE_LEN_S];
    char ostr[STE_LEN_S];
    ostr[0] = 0;
    if (argc != 4)
    {
        printf("usage: ./cmd divider remainder check\n");
        exit(1);
    }
    u_int divider = atoi(argv[1]);
    u_int remainder = atoi(argv[2]);
    u_int check = 0;
    check = atoi(argv[3]);

    while(NULL != fgets(str, STE_LEN_S, stdin))
    {
        str_trim_tail(str);
        ostr[0] = 0;
        strncpy(ostr, str, STE_LEN_S);
            
        creat_sign_fs64((char*)str, strlen(str), &uint_1, &uint_2);
        sign = ((unsigned long) (uint_2) << 32) | uint_1;
        if (sign % divider == remainder)
        {
            printf("%s\n", str);
        } 
        if (check == 1) {
            printf("str:[%s]\tsign:[%lu]\tremaind[%lu]\n", str, sign, sign % divider);
        }
        printf("%lx\n", sign);

        //-------------------------------------------
        //const char *segs[STE_LEN_S];
        //char *p;
        //p = strstr(str, "BAIDUID=");
        //if (p)
        //{
        //    p += 8;
        //    //printf ("%s\n", p);
        //}
        //else
        //{
        //    continue;
        //}
        //str_split(p, segs, STE_LEN_S, ":");
        //if (strlen(segs[0]) != 32)
        //{
        //    continue;
        //}
        //
        //sign = 0;
        //uint_1 = 0;
        //uint_2 = 0;
        //creat_sign_fs64((char*)segs[0], strlen(segs[0]), &uint_1, &uint_2);
        //sign = ((unsigned long) (uint_2) << 32) | uint_1;
        ////printf("%s\t%lu\n", segs[0], sign);
        //if (sign % divider == remainder)
        //{
        //    printf("%s\n", ostr);
        //}      
        //if (check == 1) {
        //    printf("divider[%u], remainder[%u], check[%u]\n\n", divider, remainder, check);
        //    printf("ostr:[%s]\nstr:[%s]\tsign:[%lu]\tremaind[%lu]\n", ostr, segs[0], sign, sign % divider);
        //}    
        
    }
    return 0;
    //FLAGS_enable_qt_im = true;
    //QtDictHandler * qt_dict = new QtDictHandler; 
    //qt_dict->init("./conf", "ufsqtdict.conf");
    //char pp_word_fname[STE_LEN_S];
    //pp_word_fname[0] = 0;
    //char _data_path[STE_LEN_S] = "./data/";
    //snprintf(pp_word_fname, STE_LEN_S, "%s/%s", _data_path, QT_CUR_WORD_ID_DAT);

    //char im_word_fname[STE_LEN_S];
    //im_word_fname[0] = 0;
    //snprintf(im_word_fname, STE_LEN_S, "%s/%s", _data_path, QT_CUR_IM_WORD_ID_DAT);

    //char im_dict_fname[STE_LEN_S];
    //im_dict_fname[0] = 0;
    //snprintf(im_dict_fname, STE_LEN_S, "%s/%s", _data_path, IM_WORD_ID_DAT);

    //char relation_fname[STE_LEN_S];
    //relation_fname[0] = 0;
    //snprintf(relation_fname, STE_LEN_S, "%s/%s", _data_path, IM_RELATION_DAT);

    //qt_dict->_gen_im_dat(pp_word_fname, im_word_fname, im_dict_fname, relation_fname);

    return 0;
}    

