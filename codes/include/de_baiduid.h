#ifndef _DEID_H
#define _DEID_H

#include <openssl/des.h>

typedef struct _id_info
{
	time_t create_time;
   	int	ip;	
} id_info;

extern des_key_schedule key;
// 初始化key值函数，必须首先调用，key值为ZxdeacAD
extern void initkey_schedule(des_key_schedule *szKeySchedule, char *keyStr);
// 调试函数，打印BAIDUID包含信息，使用前必须调研initkey_schedule函数
extern int show_id(char *BAIDUID);
// 解码函数，使用前必须调用initkey_schedule函数
extern int deid(char *BAIDUID, id_info &info);


#endif
