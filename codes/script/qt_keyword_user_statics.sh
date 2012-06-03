#!/bin/sh

DAY=`date -d '1 days ago' +%Y%m%d`
DAY_OLD=`date -d '62 days ago' +%Y%m%d`

DATE=`date -d '1 days ago' +%Y-%m-%d`

#========
#DAY="20110520"
#DATE="20110520"
#========
UFS_DATA_DIR="../data/"
UFS_QT_NAME_PREFIX="ufs_qt_keyword_user"
UFS_QT_DATA="${UFS_QT_NAME_PREFIX}.${DAY}"
#ITEM="ufs_qt_keywordid_user_daily_new"
#TODO mirage 
ITEM="ufs_qt_keywordid_user_daily_migrate"

LOG_DIR="../log/"
LOG_FILE="${LOG_DIR}${UFS_QT_NAME_PREFIX}.log"
RESULT_FILE="${UFS_DATA_DIR}${UFS_QT_DATA}.tmp"
WORD_DICT="${UFS_DATA_DIR}word_dict.${DAY}"


#mysql 
DATABASE="ufs_tzy"
TABLE_PREFIX="qt_keyword_user_"
DAYS_TO_REMOVE="`date -d '62 days ago' +%Y%m%d`"
MYSQL_EXEC="/home/cpro/mysql-ufs/bin/mysql -uufs -p123456 -htc-cp-ks06.tc -D${DATABASE} -f"
REMOVE_OLD_DATA_CMD="drop table ${DATABASE}.${TABLE_PREFIX}${DAYS_TO_REMOVE}"
REMOVE_ORIGINAL_DATA_CMD="DROP TABLE IF EXISTS ${DATABASE}.${TABLE_PREFIX}${DAY}"
CREATE_NEW_TABLE_CMD="create table ${DATABASE}.${TABLE_PREFIX}${DAY} like ${DATABASE}.${TABLE_PREFIX}tmp"
LOAD_DATA_CMD="LOAD DATA LOCAL INFILE '${RESULT_FILE}' INTO TABLE ${DATABASE}.${TABLE_PREFIX}${DAY} FIELDS TERMINATED BY '\t'; SHOW WARNINGS;" 

#DROP TABLE IF EXISTS `qt_keyword_user_tmp`;
#CREATE TABLE `qt_keyword_user_tmp` (
#  `date` date default NULL,
#  `uid` varchar(10) default NULL,
#  `gid` varchar(10) default NULL,
#  `keywordid` int(11) default NULL,
#  `keyword` varchar(48) default NULL,
#  `adview` bigint(20) default NULL,
#  `click` int(11) default NULL,
#  `gain` bigint(20) default NULL
#) ENGINE=MyISAM DEFAULT CHARSET=gbk;

#mail
#MAIL_CC_LIST="yanjie@baidu.com"
#MAIL_CC_LIST="tzy313@126.com"
MAIL_TO_LIST="huangjian@baidu.com"
MAIL_FROM="tianzhiyu04@baidu.com"
SUBJECT="UFS_QT_分关键词分客户维度统计_${DAY}"
REPORT_TITLE="UUFS_QT_分关键词分客户维度统计"
REPORT_ITEMS="日期#userid#groupid#关键词id#关键词#展现量#点击量#消费量(单位:分)#产品类型(0:嵌入式 1:悬浮 2:贴片)#物料类型(1:text 2:img 3:video)#CTR(%)#CPM"
PV_COL_NUM="6"
CLICK_COL_NUM="7"
GAIN_COL_NUM="8"
# sort -n 选项时 下标从0开始， -k 下标从1开始
#    awk 中的下标从 1 开始
SORT_COL_ARG=""

REPORT_FILE="./${UFS_QT_NAME_PREFIX}.html"


database_affair()
{
	# remove old data
	echo ${REMOVE_OLD_DATA_CMD} | ${MYSQL_EXEC} 
    if [ ! -f ${RESULT_FILE} ]
	then
	    return;
	fi
	# dorp table if exits
	echo ${REMOVE_ORIGINAL_DATA_CMD} | ${MYSQL_EXEC}
	# create new table
	echo ${CREATE_NEW_TABLE_CMD} | ${MYSQL_EXEC} 
	# load data
	echo ${LOAD_DATA_CMD} | ${MYSQL_EXEC} 
	
}

#
# mail the report to some one
mail_report()
{
	# 1. clear report file
	rm -f ${REPORT_FILE}

	# 2. get data from 
	echo "<STYLE type=\"text/css\"> <!--@import url(scrollbar.css); --></STYLE><html><HEAD>" >> ${REPORT_FILE}
	echo "<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html;charset=utf-8\"><STYLE>" >> ${REPORT_FILE}
	echo "td {font-size:9pt; font-color:black;text-align:left}
	.label {font-size:9pt; font-color:#505050; background-color:#CCCCCC; width:200;text-align:center}
	.title{font-size:10.5pt; font-color:#000000; background-color:#CCCCFF;text-align:center;}
	H1 {font-size:14pt; font-family: Arial, Verdana; font-weight:bold;font-color:#6666CC;}
	</STYLE></HEAD><body bgcolor=white margin=0>" >> ${REPORT_FILE}

	echo "<table  border=1 align=center cellPadding=2 bgcolor=#F4F7F4 cellSpacing=0 bordercolor=#000000 bordercolorlight=#EAECEB bordercolordark=#999999 width=100%>" >> ${REPORT_FILE}

	echo "<center><font size=3 color=blue face=宋体><span lang=EN-US style='font-size:12.0pt;color:black;letter-spacing:.75pt;font-weight: bold;'>${REPORT_TITLE}</center>" >> ${REPORT_FILE}
	echo "<table  table-layout:fixed border=1 align=center cellPadding=2 bgcolor=#F4F7F4 cellSpacing=0 bordercolor=#000000 bordercolorlight=#EAECEB bordercolordark=#999999 width=100%>" >> ${REPORT_FILE}
	awk -F"\t" -v items="${REPORT_ITEMS}" '
			BEGIN{ 
				item_num = split(items, item_arr, "#");
				print "<tr> <h1>";
				table_tr_td_width=100/item_num;
				for (i=1;i<=item_num;i++)
				{
					print "<td width=" table_tr_td_width "%>" item_arr[i] "</td>";
				}
				print "</tr>"
			}
			{
				print "<tr>"
				for (i=1;i <= NF; i++)
				{
					print "<td width=" table_tr_td_width "%>"$i"</td>"
				}
				print "</tr>"
				
			}' ${RESULT_FILE} >> ${REPORT_FILE}
	echo "</table>" >> ${REPORT_FILE}
	echo "<br><br>" >> ${REPORT_FILE} 
	echo "</body></html>" >> ${REPORT_FILE}

	# 3. send mail
	echo "send mail ..." 
	cat ${REPORT_FILE} |formail -I "From: ${MAIL_FROM}" -I "MIME-Version:1.0" -I "Content-type:text/html;charset=gb2312" -I "Subject: ${SUBJECT}" -I "To: ${MAIL_TO_LIST}" -I "Cc: ${MAIL_CC_LIST}"| /usr/sbin/sendmail -toi ${MAIL_TO_LIST}
}

# add ctr and cpm to data, and sort by ctr desc
# usage: add_ctr_cpm pv click gain
add_ctr_cpm()
{
    if [ $# -lt 3 ] 
    then    
        echo "usage: add_ctr_cpm pv_col_num click_col_num gain_col_num" ;
        return 1;
    fi
    
    awk -F"\t" -v PV_COL_NUM=$1  -v CLICK_COL_NUM=$2 -v GAIN_COL_NUM=$3 '
        {       
            printf("%s",$0);
            if ( $PV_COL_NUM != 0)
            {       
                printf("\t%.4f", 100 * $CLICK_COL_NUM / $PV_COL_NUM) ;
            }       
            else    
            {       
                printf("\t0");
            }       

            if ( $PV_COL_NUM != 0 )
            {       
                printf("\t%.2f", 1000 / 100 * $GAIN_COL_NUM / $PV_COL_NUM) ;
            }       
            else    
            {       
                printf("\t0");
            }       
        
            printf( "\n");
        }' ${RESULT_FILE} > ${RESULT_FILE}.tmp
    sort ${SORT_COL_ARG} ${RESULT_FILE}.tmp > ${RESULT_FILE}
    rm  -f ${RESULT_FILE}.tmp
}

# add wordid -> word
# usage : add_word orginal_file wordid_col_num wordid_word_file
add_word()
{
	if [ $# -lt 3 ] 
    then    
        echo "usage : add_word orginal_file wordid_col_num wordid_word_file";
        return 1;
    fi
	
	ORGINAL_FILE=$1;
	WORDID_WORD_FILE=$3;
	awk -F"\t" -v WORDID_COL_NUM=$2 '
		{
			if (FNR == NR)
			{
				word_dict[$1] = $2;
			}
			else
			{
				for (i = 1; i <= NF; i ++)
				{
				    if (i != 1)
					{
						printf("\t");
					}
					if (i == WORDID_COL_NUM)
					{
						printf("%s\t%s", $i, word_dict[$i]);
					}
					else
					{
						printf("%s", $i);
					}
				}
				printf("\n");
			}
		}'  ${WORDID_WORD_FILE} ${ORGINAL_FILE} > ${ORGINAL_FILE}.tmp
	mv ${ORGINAL_FILE}.tmp ${ORGINAL_FILE}
}




# ensure the directory exists
mkdir -p ${UFS_DATA_DIR}
mkdir -p ${LOG_DIR}

# redirect output to log file
exec 1>> ${LOG_FILE} 2>&1

#log
echo "====================================================================================" 
echo "start ${UFS_QT_NAME_PREFIX} statics at `date`" 

# 0. remove old data
echo "remove old data" 
rm -f "${UFS_QT_NAME_PREFIX}.${DAY_OLD}"

# 1. download qt  data
echo "download qt data ..."  
wget "http://logdata.baidu.com/?m=Data&a=GetData&token=ecom_cpro_2ig4tj1tsbai41tunq5rvi&product=ecom_cpro&date=${DAY}00:00:00&item=${ITEM}" -q -O "${UFS_DATA_DIR}${UFS_QT_DATA}"
wget "http://logdata.baidu.com/?m=Data&a=GetData&token=ecom_cpro_2ig4tj1tsbai41tunq5rvi&product=ecom_cpro&date=${DAY} 00:00:00&item=${ITEM}&type=md5" -O "${UFS_DATA_DIR}${UFS_QT_DATA}.mark"
online=`awk '{print $2}' ${UFS_DATA_DIR}${UFS_QT_DATA}.mark` 
offline=`md5sum ${UFS_DATA_DIR}${UFS_QT_DATA} | awk '{print $1}'`
if [ "$online" != "$offline" ]
then
echo "error log data" | formail -I "From: ${MAIL_FROM}" -I "MIME-Version:1.0" -I "Content-type:text/html;charset=gb2312" -I "Subject: ${SUBJECT}" -I "To: ${MAIL_TO_LIST}" -I "Cc: ${MAIL_CC_LIST}"| /usr/sbin/sendmail -toi ${MAIL_TO_LIST}
echo "error log data"
exit -1
fi

# 2 download [wordid\twordid] file 
echo "start to download direct"
wget "ftp://jx-sf-marlin00.jx.baidu.com:/home/work/offline_var/data/wordlist/wordlist.${DAY}" -q -O "${WORD_DICT}"


awk -F"\t" '{printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",$3, $1, $2, $4, $5, $6, $7, $8)}' ""${UFS_DATA_DIR}${UFS_QT_DATA}"" > "${RESULT_FILE}"
# 2.1 insert word to file 
sort +0n -T${UFS_DATA_DIR} "${RESULT_FILE}" > "${RESULT_FILE}".sorted
./keyword_map "${WORD_DICT}" "${RESULT_FILE}".sorted 0 > "${RESULT_FILE}.tmp"
rm -f "${RESULT_FILE}".sorted


# 2.2 insert date to file
echo "insert date to file" 
awk -F"\t" -v d="${DATE}" '{printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",d, $3, $4, $1, $2, $5, $6, $7, $8, $9);}' "${RESULT_FILE}.tmp" > "${RESULT_FILE}"


# 3. database affair: save into DB
echo "database affairs..." 
database_affair

# 4.0 add ctr cpm, and sort by ctr desc
add_ctr_cpm ${PV_COL_NUM} ${CLICK_COL_NUM} ${GAIN_COL_NUM}
 

# 4. mail the report
#mail_report


# 5. mail the wuliao overall report
#sh ./qt_wuliao_report.sh ${DAY}

# remove tmp file
echo "remove unused files..." 
rm -f ${UFS_DATA_DIR}${UFS_QT_DATA}
rm -f ${UFS_DATA_DIR}${UFS_QT_DATA}.mark
rm -f ${RESULT_FILE}
rm -f ${WORD_DICT}
rm -f ${RESULT_FILE}.tmp


echo "finish ${UFS_QT_NAME_PREFIX} statics at `date`" 
echo "====================================================================================" 
