#ifndef _DEID_H
#define _DEID_H

#include <openssl/des.h>

typedef struct _id_info
{
	time_t create_time;
   	int	ip;	
} id_info;

extern des_key_schedule key;
// ��ʼ��keyֵ�������������ȵ��ã�keyֵΪZxdeacAD
extern void initkey_schedule(des_key_schedule *szKeySchedule, char *keyStr);
// ���Ժ�������ӡBAIDUID������Ϣ��ʹ��ǰ�������initkey_schedule����
extern int show_id(char *BAIDUID);
// ���뺯����ʹ��ǰ�������initkey_schedule����
extern int deid(char *BAIDUID, id_info &info);


#endif
