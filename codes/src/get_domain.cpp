#include <cstdlib>
#include <cstring>
#include <cstdio>
#include <netinet/in.h>
#include <arpa/inet.h>


const int UL_IGNORE_COUNT=47;

typedef struct ul_ilist
{
    char name[36];
    int length;
}ul_ilist_t;

const ul_ilist_t ul_ignore_list[] = {
    {"ac.",3},
    {"ah.",3},
    {"bj.",3},
    {"co.",3},
    {"com.",4},
    {"cq.",3},
    {"ed.",3},
    {"edu.",4},
    {"fj.",3},
    {"gd.",3},
    {"go.",3},
    {"gov.",4},
    {"gs.",3},
    {"gx.",3},
    {"gz.",3},
    {"ha.",3},
    {"hb.",3},
    {"he.",3},
    {"hi.",3},
    {"hk.",3},
    {"hl.",3},
    {"hn.",3},
    {"jl.",3},
    {"js.",3},
    {"jx.",3},
    {"ln.",3},
    {"mo.",3},
    {"ne.",3},
    {"net.",4},
    {"nm.",3},
    {"nx.",3},
    {"or.",3},
    {"org.",4},
    {"pe.",3},
    {"qh.",3},
    {"sc.",3},
    {"sd.",3},
    {"sh.",3},
    {"sn.",3},
    {"sx.",3},
    {"tj.",3},
    {"tw.",3},
    {"www.",4},
    {"xj.",3},
    {"xz.",3},
    {"yn.",3},
    {"zj.",3}
};

int ul_is_ignore(char* slip)
{
    int head=0;
    int tail=UL_IGNORE_COUNT-1;
    int cur;
    int ret;
    while(head <= tail)
    {
        cur=(head+tail)/2;
        ret=strncmp(slip,ul_ignore_list[cur].name,ul_ignore_list[cur].length);
        if(ret <0)
        {   
            tail=cur-1;
        }
        else if (ret >0)
        {
            head=cur+1;
        }
        else
        {
            return 1;
        }
    }
    return 0;
}


int ul_is_dotip(const char *sitename)
{
    in_addr l_inp;
    int ret;

    ret = inet_aton(sitename, &l_inp);
    return ret;
}


int get_main_domain(const char *site, char *domain, int size)
{
    if (site == NULL || domain == NULL) {
        //AS_LOG_WARNING("parameter wrong.site:%p,domain:%p", site, domain);
        return -1;
    }

    const char *pfirst = NULL;
    const char *ptail = NULL;

    int len = 0;

    if (ul_is_dotip(site) == 1) {
        //AS_LOG_DEBUG("site:%s is dotip", site);
        goto NODOMAIN;
    }

    ptail = site + strlen(site);

    pfirst = strrchr(site, '.');
    if (pfirst == NULL) {
        goto NODOMAIN;
    }

    --pfirst;

    while (pfirst > site) {
        if ((pfirst < site) || *pfirst == '.') {
            char* pch = (char*)pfirst + 1;
            if (ul_is_ignore(pch) == 0) {
                len = size - 1 > ptail - pfirst - 1 ? ptail - pfirst - 1 : size - 1;
                snprintf(domain, len + 1, "%s", pfirst + 1);
                //memmove(domain, pfirst + 1, (uint64_t)len);
                //domain[len] = 0;
                return 1;
            }
        }
        pfirst--;
    }

 NODOMAIN:
    if (site != domain) {
        snprintf(domain, size, "%s", site);
        //strncpy(domain, site, (uint64_t)(size - 1));
        //domain[size - 1] = 0;
    }
    return 1;
} 

int main(int argc, char **)
{
    if (argc != 2)
    {
        printf("Usage: echo site | ./cmd run\n");
        exit(0);
    }
    char domain[255];
    char site[255];
    domain[0] = '\0';
    site[0] = '\0';
    while (EOF!=fscanf(stdin, "%s", site))
    {
        get_main_domain(site, domain, sizeof(domain));
        printf("%s\n", domain);
    }
    return 0;
}
