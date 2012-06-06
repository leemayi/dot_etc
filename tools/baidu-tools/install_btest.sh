#!/bin/sh

#/***************************************************************************
# * 
# * Copyright (c) 2010 Baidu.com, Inc. All Rights Reserved
# * 
# **************************************************************************/
 
#/**
# * @file install_btest.sh
# * @author wang.dong@baidu.com
# * @date 2010/03/02 18:24:48
# * @version $Revision: 1.7 $ 
# * @brief installation script for btest 
# *  
# **/

##! ********************** configuration **********************

VERSION="1.3.1"
GTEST_TAG="gtest_1-0-6-0_PD_BL"
REPORTLIB_TAG="cpp_2-0-1-1_PD_BL"
MAC_BIT=`/usr/bin/getconf LONG_BIT`
BTEST_SITE="ftp://atp.baidu.com/btest${DEBUG_BTEST}/${MAC_BIT}/"
BTEST_FILES="btest-${VERSION}.tar.gz"
VALGRIND_PACKAGE="valgrind-3.5.0.tar.bz2"
PRESENT_DIR=`pwd`
LOG_FILE=${PRESENT_DIR}"/"`date "+%Y_%m_%d_%H_%M_%S"`"_install.log"
LOG_LEVEL=16
STAT_DATA=`cat ~/.btest/.bteststat_$(date "+%Y-%m-%d").data 2>/dev/null`
BTEST_WORK_ROOT=$HOME
GTEST_DIR=com/btest/gtest
GTEST_HOME=${BTEST_WORK_ROOT}/com/btest/gtest/output

#-f,���svn workspace����ӦgtestĿ¼�Ѵ���,y/Y����ʾ,���ݺ���а�װ;n/N�˳�btest��װ
INSTALL_WITH_BACKUP=""

#-V,������ص�valgrind�汾��������Ҫ��,���-Vֱ��ָ����װĿ¼
VALGRIND_INSTALL_DIR=""

ROLLBACK_LIST=(
  [0]=0   #~/btest
  [1]=0   #~/.btest
  [2]=0   #gtest
  [3]=0   #reportlib
  )

CRITICAL=1
ERROR=2
WARNING=4
INFO=8
DEBUG=16
LOG_LEVEL_TEXT=(
	[1]="CRITICAL"
	[2]="ERROR"
	[4]="WARNING"
	[8]="INFO"
	[16]="DEBUG"
)

TTY_FATAL=1
TTY_PASS=2
TTY_TRACE=4
TTY_INFO=8
TTY_MODE_TEXT=(
	[1]="[FAIL ]"
	[2]="[PASS ]"
	[4]="[TRACE]"
	[8]="[INFO ]"
)

#0  OFF  
#1  ������ʾ
#4  underline  
#5  ��˸  
#7  ������ʾ
#8  ���ɼ� 

#30  40  ��ɫ
#31  41  ��ɫ 
#32  42  ��ɫ  
#33  43  ��ɫ  
#34  44  ��ɫ
#35  45  �Ϻ�ɫ
#36  46  ����ɫ  
#37  47  ��ɫ
TTY_MODE_COLOR=(
	[1]="1;31"	
	[2]="1;32"
	[4]="0;36"	
	[8]="1;33"
)

##! ********************** utils  *********************
Usage()
{
	echo "usage: $0"
	echo "		-d btest_file_dir           Local svn workspace."
  echo "    -f                          Force to install btest even if the local workspace directory exists."
  echo "    -V [Valgrind Install Dir]   To specify the valgrind install directory."
	echo "		-h                          Get usage."
	exit 0
}

Version()
{
	echo "version = $VERSION"
	exit 0
}

##! @BRIEF: print info to tty
##! @AUTHOR: wang.dong@baidu.com
##! @IN[int]: $1 => tty mode
##! @IN[string]: $2 => message
##! @IN[int]: $3=> go to next row:0=>yes,1=>no
##! @RETURN: 0 => sucess; 1 => fail
Print()
{
	local tty_mode=$1
	local message="$2"
	local goto_next_row=""

	#�����3��������ֵΪ0���򲻽��л���
	if [ $# -ge 3 ] && [ $3 -eq 0 ]
	then
		goto_next_row="n"
	fi

  echo -e$goto_next_row "\e[${TTY_MODE_COLOR[$tty_mode]}m${TTY_MODE_TEXT[$tty_mode]}${message}\e[m"
	return 0
}

##! @BRIEF: clean env
##! @AUTHOR: wang.dong@baidu.com
##! @RETURN: 0 => success; 1 => failure
CleanEnv()
{
  rm -vf "$PRESENT_DIR/$BTEST_FILES" >> $LOG_FILE 2>&1
  rm -vf "$PRESENT_DIR/$VALGRIND_PACKAGE" >> $LOG_FILE 2>&1
  rm -rvf "$PRESENT_DIR/${BTEST_FILES:0:`expr length $BTEST_FILES`-7}" >> $LOG_FILE 2>&1
  #rm -rvf ${BTEST_WORK_ROOT}/com/btest/output_tmp >> $LOG_FILE 2>&1$
  #cp -rvf ${BTEST_WORK_ROOT}/com/btest/gtest/output ${BTEST_WORK_ROOT}/com/btest/output_tmp >> $LOG_FILE 2>&1$
  #rm -rvf ${BTEST_WORK_ROOT}/com/btest/gtest/* >> $LOG_FILE 2>&1$
  #mv -v ${BTEST_WORK_ROOT}/com/btest/output_tmp ${BTEST_WORK_ROOT}/com/btest/gtest/output >> $LOG_FILE 2>&1$
  #rm -rvf ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp >> $LOG_FILE 2>&1$
  mv "$LOG_FILE" $HOME/btest/ >/dev/null 2>&1 
  return 0
}

##! @BRIEF: write log
##! @AUTHOR: xuanbiao@baidu.com
##! @IN[int]: $1 => log level
##! @IN[string]: $2 => message
##! @RETURN: 0 => success; 1 => failure
WriteLog()
{
	local log_level=$1
	local message="$2"

	if [ $log_level -le $LOG_LEVEL ]
	then
		local time=`date "+%Y-%m-%d %H:%M:%S"`
		echo "${LOG_LEVEL_TEXT[$log_level]}: $time: $message" >> $LOG_FILE 2>&1
	  if [ $# -ge 3 ] && [ $3 -eq 0 ]
    then
      return 0
		fi

		case $1 in
			1|2)log_level=1
				;;
			*)	log_level=8
				;;
		esac	
		Print $log_level "$message" 
	fi
	return 0
}

##! @BRIEF: send mail
##! @AUTHOR: xuanbiao
##! @IN[string] $1 => mailto
##! @IN[string] $2 => title
##! @IN[string] $3 => content
##! @IN[arr] optional $4 => attachments
##! @RETURN: 0 => sucess; 1 => failure
SendMail()
{
	local mailto="$1"
	local title="$2"
	local content="$3"
	local attach_arr=$4

	local ret
	#����ļ�����������max_file_num������
	local max_file_num=5
	local gzip_file
	local mail_attach_str
	local attachs=()

	#��������˸���
	if [ -n "$attach_arr" ]
	then
		attachs=(`eval "echo \"\\\${\$attach_arr[@]}\""`)
		#����һ���ļ���ֱ�Ӵ��������ccover�Ľ��
		if [ ${#attachs[@]} -eq 1 ] && [ -d ${attachs[0]} ]
		then
			gzip_file="${attachs[0]}.tar.gz"
			tar zcf $gzip_file ${attachs[@]}
			mail_attach_str="-a $gzip_file"
		elif [ ${#attachs[@]} -gt $max_file_num ]	#����max_file_num��������
		then
			#FIXME:�ļ������������·���Ұ���Ŀ¼��
			local dir=`dirname ${attachs[0]}`
			gzip_file="${dir}.tar.gz"
			tar zcf $gzip_file ${attachs[@]}
			mail_attach_str="-a $gzip_file"
		else
			for ((i=0; $i<${#attachs[@]}; i=$i+1))
			do
				mail_attach_str="$mail_attach_str -a ${attachs[$i]}"
			done
		fi
	fi
	#echo "attachs: $mail_attach_str"
	#echo -e "${content}" | mail -s "${title}" "${mailto}"
	#echo -e "<font color='red'>${content}</font>" | mutt -F tmp.muttrc -s "${title}" -a tmp.muttrc "${mailto}"
	#����Ϊ���ı���
	export LANG=zh_CN
	#����btest�ʼ���
	echo -e "${content}" | mutt -s "${title}" -c "" ${mail_attach_str} ${mailto} >/dev/null 2>&1
	#echo -e "${content}" | mutt -s "${title}" ${mail_attach_str} ${mailto} >/dev/null 2>&1
	ret=$?
	if [ -n "${gzip_file}" ]
	then
		rm ${gzip_file} >/dev/null 2>&1
	fi
	#echo -e "<font color='red'>${content}</font>" | mutt -s "${title}" -a tmp.muttrc -e "my_hdr Content-Type: text/html" "${mailto}"

	return $ret
}

##! @BRIEF: process the params 
##! @AUTHOR: xuanbiao@baidu.com
##! @IN[int]: $1 => type:0=>no option;1=>optional;2=>must
##! @IN[string]: $2 => param
##! @IN[string]: $3 => option
##! @OUT[string]: $4 => option value is set if needed
##! @RETURN: n => offset to shift
ProcessParam()
{
	local type=$1
	local param="$2"
	local option="$3"

	#���û�л�������
	[ $type -eq 0 ] && return 0

	#�������
	case ${option:0:1} in
		-|"")	[ $type -eq 2 ] && echo "option $param requires an argument" && Usage
				return 1
				;;
		*)		eval $4=\"$option\"
				return 2
				;;
	esac

	return 0
}

##! ******************** operation functions **********************

##! @BRIEF: set env variable
##! @AUTHOR: wang.dong@baidu.com
##! @IN[string]: $1 => variable name
##! @IN[string]: $2 => variable value
##! @IN[int]: $3 => single value:0=>true;1=>false
##! @RETURN: 0=>success;1=>fail
SetEnvVar()
{
	local var_name=$1
	local var_value=$2
	local single_value=$3
	local bash_profile_content=`cat ~/.bash_profile`
	local find_btest_flag=0
	local var_add_type=0
	local prefix="export $var_name="
	local prefix_len=`expr length "$prefix"`
	local enter_flag=$'\n'
	local has_btest_flag=`echo "$bash_profile_content" | grep '^#BTEST_FLAG_START$'`

  if [ $# -lt 3 ]
  then
    single_value=0
  fi 
  
	if [ "${var_value:`expr length "$var_value"`-1:1}" == "/" ]
	then
		var_value="${var_value:0:`expr length "$var_value"`-1}"
	fi
	
  #����.bash_profile
  WriteLog $DEBUG "��ʼ����.bash_profile�ļ�" 0
  cp "$HOME/.bash_profile" "$HOME/.bash_profile.bak"
	if [ $? -ne 0 ]
	then
		WriteLog $ERROR "����$HOME/.bash_profileʧ��" 	
        return 1
    fi			

	#�����btest����д�뻷������
	WriteLog $INFO "д��BTEST��������$1..."
	if [ -z "$has_btest_flag" ]
	then
		local warning="###############Please don't modify this section, or errors will occur!###############"
		bash_profile_content="$bash_profile_content$enter_flag$enter_flag$enter_flag$warning$enter_flag#BTEST_FLAG_START$enter_flag"
		if [ $single_value -eq 0 ]
		then
			bash_profile_content="$bash_profile_content$prefix$var_value:$""$var_name$enter_flag"
		else
			bash_profile_content="$bash_profile_content$prefix$var_value$enter_flag"
		fi
		bash_profile_content="$bash_profile_content#BTEST_FLAG_END$enter_flag$warning$enter_flag"
	else
		bash_profile_content=""
      	while read -r oneline
      	do
      		#����ҵ�BTEST����������Ŀ�ʼ���
      		if [ $find_btest_flag -eq 1 ]
      		then
				#�������BTEST����������Ľ������
				if [ "$oneline" == "#BTEST_FLAG_END" ]
				then
					find_btest_flag=0

					#�����BTEST����������û���ҵ�$1��������Ϊ��������
					if [ $var_add_type -eq 0 ] 
					then
						if [ $single_value -eq 0 ]
						then
							bash_profile_content="$bash_profile_content$prefix$var_value:$""$var_name$enter_flag"
						else
							bash_profile_content="$bash_profile_content$prefix$var_value$enter_flag"
						fi
					fi
					bash_profile_content="$bash_profile_content$oneline$enter_flag"
					continue
				fi

      			#�����BTEST�������������ҵ�$1��������
      			if [ "${oneline:0:$prefix_len}" == "$prefix" ]
      			then
      				var_add_type=1
      				bash_profile_content="$bash_profile_content$prefix$var_value"
					
					if [ $single_value -eq 0 ]
					then
						local oneline_len=`expr length "$oneline"`
						local value_list=`echo "${oneline:$prefix_len:$oneline_len-$prefix_len}" | awk -F ':' 'BEGIN{}{for(i=1;i<=NF;i++)print $i;}END{}'`
						for value in $value_list
						do
							if [ ${value:`expr length "$value"`-1:1} ==  "/" ]
							then
								value="${value:0:`expr length "$value"`-1}"
							fi
						
							if [ "$value" != "$var_value" ]
							then
								bash_profile_content="$bash_profile_content:$value"	
							fi
						done
					fi
						bash_profile_content="$bash_profile_content$enter_flag"
      			else
      				bash_profile_content="$bash_profile_content$oneline$enter_flag"
      			fi
				continue
      		fi

      		#�ҵ�BTEST����������Ŀ�ʼ���
      		if [ "$oneline" == "#BTEST_FLAG_START" ]
      		then
      			find_btest_flag=1
      		fi
      		
      		bash_profile_content="$bash_profile_content$oneline$enter_flag"
      	done < ~/.bash_profile
	fi
	
	WriteLog $DEBUG "������ú��BTEST��������д�뵽$HOME/.bash_profile��" 0
	echo -n "$bash_profile_content" > ~/.bash_profile

	return 0
}

##! @BRIEF: ��װBTEST�����
##! @AUTHOR: wang.dong@baidu.com
##! @RETURN: 0=>success;1=>fail
CopyPlugin()
{
	WriteLog $DEBUG "�л�����Ŀ¼��$PRESENT_DIR" 0
	cd "$PRESENT_DIR"
	if [ $? -ne 0 ]
	then
		WriteLog $CRITICAL "�޷��л�Ŀ¼��$PRESENT_DIR"
		return 1
	fi
	
	WriteLog $INFO "��ʼ����BTEST����İ�װ��..."
	wget "$BTEST_SITE$BTEST_FILES" >> $LOG_FILE 2>&1
	if [ $? -eq 0 ]
	then
		WriteLog $INFO "����BTEST�����װ���ɹ�"
		WriteLog $INFO "��ʼ��ѹBTEST�����װ��..."
		tar -zxvf "$BTEST_FILES" >> $LOG_FILE 2>&1
		if [ $? -eq 0 ]
		then
			WriteLog $INFO "��ѹBTEST�����װ���ɹ�"
			WriteLog $DEBUG "���${HOME}Ŀ¼��д��Ȩ��..." 0
			if [ ! -w "$HOME" ]
			then
				WriteLog $CRITICAL "${HOME}û��д��Ȩ��"
				return 1
			fi
			
			local obj_dir="$PRESENT_DIR/${BTEST_FILES:0:`expr length "$BTEST_FILES"`-7}"
			WriteLog $DEBUG "�л���Ŀ¼${obj_dir}��" 0
			cd $obj_dir
			if [ $? -ne 0 ]
			then
				WriteLog $CRITICAL "�л���Ŀ¼${obj_dir}ʧ��"
				return 1
			fi
						
		  local son_dirs_list=`ls -a`
			for son_dir in $son_dirs_list
			do
				if [ "$son_dir" == "." ] || [ "$son_dir" == ".." ]
				then
          continue
        fi
        if [ "${son_dir}" == ".vim" ]
        then
          cp -brf "${obj_dir}/${son_dir}" "${HOME}"
        else
          rm -rf "${HOME}/${son_dir}_old" >> $LOG_FILE 2>&1
          mv "${HOME}/${son_dir}" "${HOME}/${son_dir}_old" >> $LOG_FILE 2>&1
          mv "${obj_dir}/${son_dir}" "${HOME}"
        fi
        if [ $? -ne 0 ]
        then
          WriteLog $CRITICAL "��װ${son_dir}��${HOME}ʧ��"
          return 1
        else
          case $son_dir in
            "btest")
              ROLLBACK_LIST[0]=1
              ;;

            ".btest")
              ROLLBACK_LIST[1]=1
              ;;
            
            *)
              ;;
          esac
          WriteLog $INFO "��װ${son_dir}��${HOME}�ɹ�"
        fi
			done
		else
			WriteLog $CRITICAL "��ѹBTEST�����װ��ʧ��"
			return 1
		fi
	else
		WriteLog $CRITICAL "����BTEST�����װ��ʧ��"
		return 1
	fi
	
  #���ִ��binĿ¼��sh�ļ���ִ��Ȩ��
  chmod +x ~/btest/bin/*
	return 0
}

##! @BRIEF: ��SVN�н�gtest���ļ�checkout����
##! @AUTHOR: wang.dong@baidu.com
##!	@IN[string]: $1 => gtest destination dir
##! @RETURN 0 => success; 1 => fail
CheckoutGtest()
{
  WriteLog $INFO "���SVN�����Ƿ����..."
  svn --version >> $LOG_FILE 2>&1
  if [ $? -ne 0 ]
  then
    WriteLog $CRITICAL "����SVNû�а�װ���밲װSVN���ٳ���"
    return 1
  fi

  WriteLog $INFO "��ʼǩ��BTest��װ��Ҫ���ļ�"
  BTEST_WORK_ROOT="${BTEST_WORK_ROOT}/"

  #���$BTEST_WORK_ROOT$GTEST_DIRĿ¼���ڣ�����ʾ�Ƿ������װ
  if [ -d "$BTEST_WORK_ROOT$GTEST_DIR" ]
  then
    local choice
    local param_backup=$INSTALL_WITH_BACKUP
    until [ "$choice" == "Y" ] || [ "$choice" == "y" ] || [ "$choice" == "N" ] || [ "$choice" == "n" ]
    do
      if [ ! -z "$param_backup" ];then
        choice=$param_backup
        param_backup=""
      else
        Print $TTY_INFO "Ŀ¼\"$BTEST_WORK_ROOT$GTEST_DIR\"�Ѵ���,����?(y/n)" 0
        read choice
      fi
    done
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]
    then
      WriteLog $DEBUG "�л�Ŀ¼��${BTEST_WORK_ROOT}��" 0
      cd "${BTEST_WORK_ROOT}"
      if [ $? -ne 0 ]
      then
        WriteLog $CRITICAL "�޷��л�Ŀ¼��${BTEST_WORK_ROOT}"
        return 1
      fi
            
      #����Ŀ¼
      if [ -d ${BTEST_WORK_ROOT}/com/btest/gtest ];then
        if [ -d ${BTEST_WORK_ROOT}/com/btest/gtest_old ];then
          rm -rvf ${BTEST_WORK_ROOT}/com/btest/gtest_old >> $LOG_FILE 2>&1
        fi
        mv -v ${BTEST_WORK_ROOT}/com/btest/gtest ${BTEST_WORK_ROOT}/com/btest/gtest_old >> $LOG_FILE 2>&1
        if [ $? -ne 0 ];then
          WriteLog $CRITICAL "����${BTEST_WORK_ROOT}/com/btest/gtest��${BTEST_WORK_ROOT}/com/btest/gtest_oldʧ��"
          return 1
        fi
      fi

      if [ -d ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp ];then
        if [ -d ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp_old ];then
          rm -rvf ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp_old >> $LOG_FILE 2>&1
        fi
        mv -v ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp_old >> $LOG_FILE 2>&1
        if [ $? -ne 0 ];then
          WriteLog $CRITICAL "����${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp��${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp_oldʧ��"
          return 1
        fi
      fi
    else
      return 2
    fi
  fi
  
  #�������Ŀ¼������
  if [ ! -d "$BTEST_WORK_ROOT" ];then
    WriteLog $INFO "��������SVN����Ŀ¼${BTEST_WORK_ROOT}..."
    mkdir -p "$BTEST_WORK_ROOT" >> $LOG_FILE 2>&1
    if [ $? -ne 0 ];then
      WriteLog $CRITICAL "��������SVN����Ŀ¼${BTEST_WORK_ROOT}ʧ��"
      return 1
    else
      WriteLog $INFO "��������SVN����Ŀ¼${BTEST_WORK_ROOT}�ɹ�"
    fi
  fi

  #ǩ��gtest
  #cd "${BTEST_WORK_ROOT}" 2>> $LOG_FILE && cvs co -r $GTEST_TAG com/btest/gtest 2>> $LOG_FILE
  cd "${BTEST_WORK_ROOT}" 2>> $LOG_FILE && svn co https://svn.baidu.com/com/tags/btest/gtest/$GTEST_TAG com/btest/gtest
  if [ $? -ne 0 ];then
    WriteLog $CRITICAL "gtestǩ��ʧ��"
    return 1
  else
    ROLLBACK_LIST[2]=1
  fi

  #ǩ��reportlib
  #cd "${BTEST_WORK_ROOT}" 2>> $LOG_FILE && cvs co -r $REPORTLIB_TAG quality/autotest/reportlib/cpp 2>> $LOG_FILE
  cd "${BTEST_WORK_ROOT}" 2>> $LOG_FILE && svn co https://svn.baidu.com/quality/autotest/tags/reportlib/cpp/$REPORTLIB_TAG quality/autotest/reportlib/cpp
  if [ $? -ne 0 ];then
    WriteLog $CRITICAL "reportlibǩ��ʧ��"
    return 1
  else
    ROLLBACK_LIST[3]=1
  fi

  #����reportlib
  cd "${BTEST_WORK_ROOT}"/quality/autotest/reportlib/cpp 2>> $LOG_FILE && make 2>> $LOG_FILE
  if [ $? -ne 0 ];then
    WriteLog $CRITICAL "reportlib����ʧ��"
    return 1
  fi
  
  #����gtest
  cd "${BTEST_WORK_ROOT}"/com/btest/gtest 2>> $LOG_FILE && sh build.sh 2>> $LOG_FILE
  if [ $? -ne 0 ];then
    WriteLog $CRITICAL "gtest����ʧ��"
    return 1
  fi

  return 0
}

Main()
{
  if [ $MAC_BIT -eq 32 ]
  then
    WriteLog $INFO "BTest��ʱ��֧��32λ����!"
    return 2
  fi

	#����������

	#-d����Ŀ¼WORK ROOT
	local opt_gtest_core_dir=""
	
	#��ʼѭ���������
	while [ $# -gt 0 ]
	do
		case "$1" in
			-v) Version
				shift
				;;
			-h) Usage
				shift
				;;
			#-d ����Ŀ¼��Ĭ��Ϊ$HOME
			-d)	ProcessParam 1 "$1" "$2" opt_gtest_core_dir
				shift $?
				;;
			#-f ���svn workspace dir����ӦgtestĿ¼�Ѵ���,ѡ�񱸷ݰ�װ���˳���װ
			-f)	ProcessParam 1 "$1" "$2" INSTALL_WITH_BACKUP 
				shift $?
				;;
			#-V ֱ��ָ����װĿ¼
			-V)	ProcessParam 1 "$1" "$2" VALGRIND_INSTALL_DIR
				shift $?
				;;
			*)  echo "Unkown option \"$1\""
				Usage
				;;
		esac
	done

	#���WORK ROOTΪ��
	if [ -z $opt_gtest_core_dir ]
	then
    local choice
    until [ "$choice" == "Y" ] || [ "$choice" == "y" ] || [ "$choice" == "N" ] || [ "$choice" == "n" ]
    do
      Print $TTY_INFO "��û��ָ������SVN����Ŀ¼������ʹ�þ���·������ָ��?(y/n)" 0
      read choice
    done
    if [ "$choice" == "Y" ] || [ "$choice" == "y" ]
    then
      #WORK_ROOT����Ϊһ������·��
      until [ "${opt_gtest_core_dir:0:1}" == "/" ]
      do 
        Print $TTY_INFO "������������SVN����Ŀ¼�ľ���·��:" 0
        read opt_gtest_core_dir
        local btest_dir_len=`expr length "$HOME/btest"`
        if [ "$HOME/btest" == "${opt_gtest_core_dir:0:$btest_dir_len}" ];then
          Print $TTY_INFO "ע��:�����·��������${HOME}/btestĿ¼������Ŀ¼"
          opt_gtest_core_dir=""
        fi
      done
    else
      opt_gtest_core_dir=$HOME
    fi
  else
    if [ "${opt_gtest_core_dir:0:1}" != "/" ]
    then
      WriteLog $INFO "ָ���ı���SVN����Ŀ¼����Ϊ����·��"
      return 1
    fi
	fi
  WriteLog $INFO "�����õı���SVN����Ŀ¼Ϊ${opt_gtest_core_dir}"
  
  BTEST_WORK_ROOT="`dirname $opt_gtest_core_dir`/`basename $opt_gtest_core_dir`"
  GTEST_HOME="${BTEST_WORK_ROOT}/${GTEST_DIR}"/output
  
  #��svn����checkout��gtest
  CheckoutGtest
  case $? in
    1)return 1
      ;;
    2)return 2
      ;;
    *)
      CopyPlugin
      if [ $? -ne 0 ]
      then
        return 1
      fi

      #��BTEST�еĻ�������$WORK_ROOT,$BTEST_HOME,$GTEST_HOME,$LD_LIBRARY_PATHд��.bash_profile��
      WriteLog $INFO "��ʼ���û�������..."
      SetEnvVar "BTEST_WORK_ROOT" "$BTEST_WORK_ROOT" 1
      SetEnvVar "BTEST_HOME" "$HOME/btest" 1
      SetEnvVar "GTEST_HOME" "$GTEST_HOME" 1
      SetEnvVar "LD_LIBRARY_PATH" '$GTEST_HOME/lib'
      SetEnvVar "PATH" '$BTEST_HOME/bin'
      
      WriteLog $INFO "���valgrind..."
      local valgrind_is_ok=1
      local version
      version=`valgrind --version 2>/dev/null`
      if [ $? -ne 0 ]
      then
        valgrind_is_ok=0
        WriteLog $ERROR "valgrindû�а�װ�����޷�ʹ��BTEST��valgrind��⹦��!" 0
      else
        file_valgrind="$(file -L $(which valgrind))" 
        tool_bit=`echo $file_valgrind | grep "ELF ${MAC_BIT}-bit LSB executable"`
        if [ -z "$tool_bit" ]
        then
          valgrind_is_ok=0
          WriteLog $ERROR "����װ��valgrind�������λ�����������޷�ʹ��BTEST��valgrind��⹦��" 0
        else
          if [[ $version < "valgrind-3.4.0" ]]
          then
            valgrind_is_ok=0
            WriteLog $ERROR "����װ��valgrind�汾̫��,����ʹ��valgrind-3.4.0(��)���ϣ����޷�ʹ��BTEST��valgrind��⹦��" 0
          fi
        fi
      fi

      if [ ${valgrind_is_ok} -eq 0 ]
      then
        choice=""
        until [ "$choice" == "Y" ] || [ "$choice" == "y" ] || [ "$choice" == "N" ] || [ "$choice" == "n" ]
        do
          if [ ! -z "$VALGRIND_INSTALL_DIR" ];then
            choice="y"
          else
            Print $TTY_INFO "û�м�⵽�ʺ�btest��valgrind�汾���Ƿ�װ���ʵ�valgrind?(y/n)" 0
            read choice
          fi
        done

        if [ "$choice" == "Y" ] || [ "$choice" == "y" ]
        then
          WriteLog $INFO "��ʼ����vargrind��װ�ļ�..." 
          cd "$PRESENT_DIR" && wget "$BTEST_SITE$VALGRIND_PACKAGE" >> $LOG_FILE 2>&1
          if [ $? -ne 0 ]
          then
            WriteLog $ERROR "����valgrind��װ�ļ�ʧ��"  
          else
            WriteLog $INFO "����valgrind��װ�ļ��ɹ�"  
            local param_valgrind_install_dir=$VALGRIND_INSTALL_DIR
            while true
            do
              local valgrind_install_dir=""
              while true
              do 
                if [ ! -z "$param_valgrind_install_dir" ];then
                  valgrind_install_dir=$param_valgrind_install_dir
                  param_valgrind_install_dir=""
                else
                  Print $TTY_INFO "��������д��Ȩ�޵�valgrind��װĿ¼�ľ���·��: " 0
                  read valgrind_install_dir
                fi
                [ "${valgrind_install_dir:0:1}" == "/" ] && break
              done

              if [ ! -d "${valgrind_install_dir}" ]
              then
                mkdir -p "${valgrind_install_dir}" >> $LOG_FILE 2>&1
                if [ $? -ne 0 ]
                then
                  WriteLog $ERROR "����valgrind��װĿ¼${valgrind_install_dir}ʧ��"
                else
                  WriteLog $INFO "����valgrind��װĿ¼${valgrind_install_dir}�ɹ�"
                fi
              fi

              if [ -w "${valgrind_install_dir}" ]
              then
                break
              else
                [ -d "${valgrind_install_dir}" ] && WriteLog $ERROR "�������valgrind��װĿ¼û��д��Ȩ��!"
              fi
            done

            WriteLog $INFO "��ʼ��װvalgrind����,�����ĵȴ�..."
            cd "$PRESENT_DIR" && tar -jxvf "$VALGRIND_PACKAGE" && cd valgrind-3.5.0 && ./configure --prefix="${valgrind_install_dir}" && make && make install >> $LOG_FILE 2>&1
            if [ $? -ne 0 ]
            then
              WriteLog $ERROR "��װvalgrindʧ��"
            else
              WriteLog $INFO "д��valgrind�Ļ�������" 0
              if [ "$HOME" == "${valgrind_install_dir}" ]
              then
                SetEnvVar "PATH" '$HOME/bin'
              else
                SetEnvVar "PATH" "${valgrind_install_dir}/bin" 
              fi
              WriteLog $INFO "��װvalgrind�ɹ�"
            fi
            cd .. && rm -rvf "$PRESENT_DIR"/valgrind-3.5.0 "$PRESENT_DIR/$VALGRIND_PACKAGE" >> $LOG_FILE 2>&1
          fi
        else
          WriteLog $ERROR "�����޷�ʹ��BTEST��valgrind��⹦��"
        fi
      fi
      
      WriteLog $INFO "���ccover�Ƿ����..."
      which covc >/dev/null 2>&1
      if [ $? -ne 0 ]
      then
        WriteLog $ERROR "ccoverû�а�װ�����޷�ʹ��BTEST�Ĵ��븲���ʷ�������"
      fi

      WriteLog $INFO "�����Զ�����..." 0
      local btest_crontab="/tmp/btest_crontab_"`whoami`
      local btest_crontab_new="${btest_crontab}_new"
      crontab -l > $btest_crontab
      echo "00 01 * * * source $HOME/.bash_profile;$HOME/btest/bin/update_btest" >> $btest_crontab
      crontab -r >/dev/null 2>&1
      echo -n > "${btest_crontab_new}"
      while read -r line
      do
        #ȥ���ɰ汾�е�����
        if [ "$line" == "00 13 * * * python $HOME/btest/bin/update_btest.py" ]
        then
          continue
        fi

        #ȥ���ظ�������
        local exist_rec=0
        while read -r newline
        do
          if [ "$newline" == "$line" ]
          then
            exist_rec=1
            break
          fi
        done < ${btest_crontab_new}

        if [ $exist_rec -eq 0 ]
        then
          echo "$line" >> "${btest_crontab_new}"
        fi
      done < $btest_crontab
      crontab $btest_crontab_new >> $LOG_FILE 2>&1
      if [ $? -ne 0 ]
      then
        WriteLog $ERROR "�����Զ�����ʧ��"
      fi
      rm -rvf $btest_crontab_new >>$LOG_FILE 2>&1

      WriteLog $INFO "BTEST-${VERSION}��װ�ɹ�"
      local banner="��ʹ����������ʹBTEST��װ��Ч:"
      local tips="source ~/.bash_profile"
      WriteLog $INFO "$tips" 0
      echo -e$goto_next_row "\033[32;49;5m${TTY_MODE_TEXT[8]}${banner}\033[39;49;0m"
      echo -e$goto_next_row "\033[32;49;1m${TTY_MODE_TEXT[8]}${tips}\033[39;49;0m"
      ;;
  esac

  [ ! -z "${STAT_DATA}" ] && echo "${STAT_DATA}" >> ~/.btest/.bteststat_$(date "+%Y-%m-%d").data
  echo "utils#installationtimes#"$(date "+%Y-%m-%d %H:%M:%S") >> ~/.btest/.bteststat_$(date "+%Y-%m-%d").data
  return 0
}

Main "$@"

case $? in
  0)
    #��װ�ɹ�,ɾ�������ļ�
    #[ -d "$HOME/btest_btestbak" ] && rm -rvf ~/btest_btestbak >> $LOG_FILE 2>&1
    #[ -d "$HOME/.btest_btestbak" ] && rm -rvf ~/.btest_btestbak >> $LOG_FILE 2>&1
    #[ -d "${GTEST_HOME}_btestbak" ] && rm -rvf ${GTEST_HOME}_btestbak >> $LOG_FILE 2>&1

    #��װ�ɹ�������ִ��һ�θ���
    WriteLog $INFO "BTEST���������У���Լ��3-5���ӣ��벻Ҫʹ��Ctrl+Cǿ����ֹ!"
    result=`source ~/.bash_profile;~/btest/bin/update_btest >/dev/null 2>&1`
    if [ $? -ne 0 ]
    then
      echo "$result" >> $LOG_FILE
    fi
    ;;

  1)
    #��װʧ��,�ع�Ŀ¼
    length=${#ROLLBACK_LIST[@]}
    for (( i=0; $i < $length; i++ ))
    do
      if [ ${ROLLBACK_LIST[$i]} -eq 1 ]
      then
        case $i in
          0)
            [ -d "$HOME/btest" ] && rm -rvf $HOME/btest >> $LOG_FILE 2>&1
            [ -d "$HOME/btest_old" ] && mv -v $HOME/btest_old $HOME/btest >> $LOG_FILE 2>&1
            ;;

          1)
            [ -d "$HOME/.btest" ] && rm -rvf $HOME/.btest >> $LOG_FILE 2>&1
            [ -d "$HOME/.btest_old" ] && mv -v $HOME/.btest_old $HOME/.btest>> $LOG_FILE 2>&1
            ;;

          2)
            [ -d "${BTEST_WORK_ROOT}/${GTEST_DIR}" ] && rm -rvf "${BTEST_WORK_ROOT}/${GTEST_DIR}" >> $LOG_FILE 2>&1
            [ -d "${BTEST_WORK_ROOT}/${GTEST_DIR}"_old ] && mv -v "${BTEST_WORK_ROOT}/${GTEST_DIR}"_old "${BTEST_WORK_ROOT}/${GTEST_DIR}" >> $LOG_FILE 2>&1
            ;;

          3)
            [ -d "${BTEST_WORK_ROOT}"/quality/autotest/reportlib/cpp ] && rm -rvf "${BTEST_WORK_ROOT}"/quality/autotest/reportlib/cpp >> $LOG_FILE 2>&1
            [ -d "${BTEST_WORK_ROOT}"/quality/autotest/reportlib/cpp_old ] && mv -v "${BTEST_WORK_ROOT}"/quality/autotest/reportlib/cpp_old "${BTEST_WORK_ROOT}"/quality/autotest/reportlib/cpp >> $LOG_FILE 2>&1
            ;;

          *)
            ;;
        esac
      fi
    done
    
    attach=(
      [0]="$LOG_FILE"
    )
    SendMail "btest-mon@baidu.com" "[BTest]��װʧ��" "" attach
    ;;

  *)
    ;;
esac

WriteLog $INFO "�������⣬����ϵbtest@baidu.com,лл!"

#������
CleanEnv
