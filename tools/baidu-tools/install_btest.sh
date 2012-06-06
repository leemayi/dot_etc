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

#-f,Èç¹ûsvn workspaceÖĞÏàÓ¦gtestÄ¿Â¼ÒÑ´æÔÚ,y/Y²»ÌáÊ¾,±¸·İºó½øĞĞ°²×°;n/NÍË³öbtest°²×°
INSTALL_WITH_BACKUP=""

#-V,Èç¹û±¾µØµÄvalgrind°æ±¾²»·ûÂú×ãÒªÇó,Ôò¿É-VÖ±½ÓÖ¸¶¨°²×°Ä¿Â¼
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
#1  ¸ßÁÁÏÔÊ¾
#4  underline  
#5  ÉÁË¸  
#7  ·´°×ÏÔÊ¾
#8  ²»¿É¼û 

#30  40  ºÚÉ«
#31  41  ºìÉ« 
#32  42  ÂÌÉ«  
#33  43  »ÆÉ«  
#34  44  À¶É«
#35  45  ×ÏºìÉ«
#36  46  ÇàÀ¶É«  
#37  47  °×É«
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

	#Èç¹ûµÚ3¸ö²ÎÊıµÄÖµÎª0£¬Ôò²»½øĞĞ»»ĞĞ
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
	#×î´óÎÄ¼ş¸öÊı£¬³¬¹ımax_file_num¸öÔò´ò°ü
	local max_file_num=5
	local gzip_file
	local mail_attach_str
	local attachs=()

	#Èç¹ûÉèÖÃÁË¸½¼ş
	if [ -n "$attach_arr" ]
	then
		attachs=(`eval "echo \"\\\${\$attach_arr[@]}\""`)
		#µ¥¶ÀÒ»¸öÎÄ¼ş¼ĞÖ±½Ó´ò°ü£¬¿¼ÂÇccoverµÄ½á¹û
		if [ ${#attachs[@]} -eq 1 ] && [ -d ${attachs[0]} ]
		then
			gzip_file="${attachs[0]}.tar.gz"
			tar zcf $gzip_file ${attachs[@]}
			mail_attach_str="-a $gzip_file"
		elif [ ${#attachs[@]} -gt $max_file_num ]	#´óÓÚmax_file_numÔò´ò°ü·¢ËÍ
		then
			#FIXME:ÎÄ¼şÃû±ØĞëÊÇÏà¶ÔÂ·¾¶ÇÒ°üº¬Ä¿Â¼Ãû
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
	#ÉèÖÃÎªÖĞÎÄ±àÂë
	export LANG=zh_CN
	#³­ËÍbtestÓÊ¼ş×é
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

	#Èç¹ûÃ»ÓĞ»·¾³±äÁ¿
	[ $type -eq 0 ] && return 0

	#´¦Àí²ÎÊı
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
	
  #±¸·İ.bash_profile
  WriteLog $DEBUG "¿ªÊ¼±¸·İ.bash_profileÎÄ¼ş" 0
  cp "$HOME/.bash_profile" "$HOME/.bash_profile.bak"
	if [ $? -ne 0 ]
	then
		WriteLog $ERROR "±¸·İ$HOME/.bash_profileÊ§°Ü" 	
        return 1
    fi			

	#Èç¹ûÊÇbtest³õ´ÎĞ´Èë»·¾³±äÁ¿
	WriteLog $INFO "Ğ´ÈëBTEST»·¾³±äÁ¿$1..."
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
      		#Èç¹ûÕÒµ½BTEST»·¾³±äÁ¿¿éµÄ¿ªÊ¼±ê¼Ç
      		if [ $find_btest_flag -eq 1 ]
      		then
				#Èç¹ûÓöµ½BTEST»·¾³±äÁ¿¿éµÄ½áÊø±ê¼Ç
				if [ "$oneline" == "#BTEST_FLAG_END" ]
				then
					find_btest_flag=0

					#Èç¹ûÔÚBTEST»·¾³±äÁ¿ÖĞÃ»ÓĞÕÒµ½$1±äÁ¿£¬ÔòÎªĞÂÔö±äÁ¿
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

      			#Èç¹ûÔÚBTEST»·¾³±äÁ¿¿éÖĞÕÒµ½$1»·¾³±äÁ¿
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

      		#ÕÒµ½BTEST»·¾³±äÁ¿¿éµÄ¿ªÊ¼±ê¼Ç
      		if [ "$oneline" == "#BTEST_FLAG_START" ]
      		then
      			find_btest_flag=1
      		fi
      		
      		bash_profile_content="$bash_profile_content$oneline$enter_flag"
      	done < ~/.bash_profile
	fi
	
	WriteLog $DEBUG "½«´¦ÀíºÃºóµÄBTEST»·¾³±äÁ¿Ğ´Èëµ½$HOME/.bash_profileÖĞ" 0
	echo -n "$bash_profile_content" > ~/.bash_profile

	return 0
}

##! @BRIEF: °²×°BTEST¸÷²å¼ş
##! @AUTHOR: wang.dong@baidu.com
##! @RETURN: 0=>success;1=>fail
CopyPlugin()
{
	WriteLog $DEBUG "ÇĞ»»¹¤×÷Ä¿Â¼µ½$PRESENT_DIR" 0
	cd "$PRESENT_DIR"
	if [ $? -ne 0 ]
	then
		WriteLog $CRITICAL "ÎŞ·¨ÇĞ»»Ä¿Â¼µ½$PRESENT_DIR"
		return 1
	fi
	
	WriteLog $INFO "¿ªÊ¼ÏÂÔØBTEST²å¼şµÄ°²×°°ü..."
	wget "$BTEST_SITE$BTEST_FILES" >> $LOG_FILE 2>&1
	if [ $? -eq 0 ]
	then
		WriteLog $INFO "ÏÂÔØBTEST²å¼ş°²×°°ü³É¹¦"
		WriteLog $INFO "¿ªÊ¼½âÑ¹BTEST²å¼ş°²×°°ü..."
		tar -zxvf "$BTEST_FILES" >> $LOG_FILE 2>&1
		if [ $? -eq 0 ]
		then
			WriteLog $INFO "½âÑ¹BTEST²å¼ş°²×°°ü³É¹¦"
			WriteLog $DEBUG "¼ì²â${HOME}Ä¿Â¼µÄĞ´ÈëÈ¨ÏŞ..." 0
			if [ ! -w "$HOME" ]
			then
				WriteLog $CRITICAL "${HOME}Ã»ÓĞĞ´ÈëÈ¨ÏŞ"
				return 1
			fi
			
			local obj_dir="$PRESENT_DIR/${BTEST_FILES:0:`expr length "$BTEST_FILES"`-7}"
			WriteLog $DEBUG "ÇĞ»»µ½Ä¿Â¼${obj_dir}ÖĞ" 0
			cd $obj_dir
			if [ $? -ne 0 ]
			then
				WriteLog $CRITICAL "ÇĞ»»µ½Ä¿Â¼${obj_dir}Ê§°Ü"
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
          WriteLog $CRITICAL "°²×°${son_dir}µ½${HOME}Ê§°Ü"
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
          WriteLog $INFO "°²×°${son_dir}µ½${HOME}³É¹¦"
        fi
			done
		else
			WriteLog $CRITICAL "½âÑ¹BTEST²å¼ş°²×°°üÊ§°Ü"
			return 1
		fi
	else
		WriteLog $CRITICAL "ÏÂÔØBTEST²å¼ş°²×°°üÊ§°Ü"
		return 1
	fi
	
  #Ìí¼ÓÖ´ĞĞbinÄ¿Â¼ÏÂshÎÄ¼şµÄÖ´ĞĞÈ¨ÏŞ
  chmod +x ~/btest/bin/*
	return 0
}

##! @BRIEF: ´ÓSVNÖĞ½«gtest¿âÎÄ¼şcheckout³öÀ´
##! @AUTHOR: wang.dong@baidu.com
##!	@IN[string]: $1 => gtest destination dir
##! @RETURN 0 => success; 1 => fail
CheckoutGtest()
{
  WriteLog $INFO "¼ì²âSVN¹¤¾ßÊÇ·ñ´æÔÚ..."
  svn --version >> $LOG_FILE 2>&1
  if [ $? -ne 0 ]
  then
    WriteLog $CRITICAL "ÄúµÄSVNÃ»ÓĞ°²×°£¬Çë°²×°SVNºóÔÙ³¢ÊÔ"
    return 1
  fi

  WriteLog $INFO "¿ªÊ¼Ç©³öBTest°²×°ĞèÒªµÄÎÄ¼ş"
  BTEST_WORK_ROOT="${BTEST_WORK_ROOT}/"

  #Èç¹û$BTEST_WORK_ROOT$GTEST_DIRÄ¿Â¼´æÔÚ£¬ÔòÌáÊ¾ÊÇ·ñ¼ÌĞø°²×°
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
        Print $TTY_INFO "Ä¿Â¼\"$BTEST_WORK_ROOT$GTEST_DIR\"ÒÑ´æÔÚ,¼ÌĞø?(y/n)" 0
        read choice
      fi
    done
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]
    then
      WriteLog $DEBUG "ÇĞ»»Ä¿Â¼µ½${BTEST_WORK_ROOT}ÖĞ" 0
      cd "${BTEST_WORK_ROOT}"
      if [ $? -ne 0 ]
      then
        WriteLog $CRITICAL "ÎŞ·¨ÇĞ»»Ä¿Â¼µ½${BTEST_WORK_ROOT}"
        return 1
      fi
            
      #±¸·İÄ¿Â¼
      if [ -d ${BTEST_WORK_ROOT}/com/btest/gtest ];then
        if [ -d ${BTEST_WORK_ROOT}/com/btest/gtest_old ];then
          rm -rvf ${BTEST_WORK_ROOT}/com/btest/gtest_old >> $LOG_FILE 2>&1
        fi
        mv -v ${BTEST_WORK_ROOT}/com/btest/gtest ${BTEST_WORK_ROOT}/com/btest/gtest_old >> $LOG_FILE 2>&1
        if [ $? -ne 0 ];then
          WriteLog $CRITICAL "±¸·İ${BTEST_WORK_ROOT}/com/btest/gtestµ½${BTEST_WORK_ROOT}/com/btest/gtest_oldÊ§°Ü"
          return 1
        fi
      fi

      if [ -d ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp ];then
        if [ -d ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp_old ];then
          rm -rvf ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp_old >> $LOG_FILE 2>&1
        fi
        mv -v ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp_old >> $LOG_FILE 2>&1
        if [ $? -ne 0 ];then
          WriteLog $CRITICAL "±¸·İ${BTEST_WORK_ROOT}/quality/autotest/reportlib/cppµ½${BTEST_WORK_ROOT}/quality/autotest/reportlib/cpp_oldÊ§°Ü"
          return 1
        fi
      fi
    else
      return 2
    fi
  fi
  
  #Èç¹û¹¤×÷Ä¿Â¼²»´æÔÚ
  if [ ! -d "$BTEST_WORK_ROOT" ];then
    WriteLog $INFO "´´½¨±¾µØSVN¹¤×÷Ä¿Â¼${BTEST_WORK_ROOT}..."
    mkdir -p "$BTEST_WORK_ROOT" >> $LOG_FILE 2>&1
    if [ $? -ne 0 ];then
      WriteLog $CRITICAL "´´½¨±¾µØSVN¹¤×÷Ä¿Â¼${BTEST_WORK_ROOT}Ê§°Ü"
      return 1
    else
      WriteLog $INFO "´´½¨±¾µØSVN¹¤×÷Ä¿Â¼${BTEST_WORK_ROOT}³É¹¦"
    fi
  fi

  #Ç©³ögtest
  #cd "${BTEST_WORK_ROOT}" 2>> $LOG_FILE && cvs co -r $GTEST_TAG com/btest/gtest 2>> $LOG_FILE
  cd "${BTEST_WORK_ROOT}" 2>> $LOG_FILE && svn co https://svn.baidu.com/com/tags/btest/gtest/$GTEST_TAG com/btest/gtest
  if [ $? -ne 0 ];then
    WriteLog $CRITICAL "gtestÇ©³öÊ§°Ü"
    return 1
  else
    ROLLBACK_LIST[2]=1
  fi

  #Ç©³öreportlib
  #cd "${BTEST_WORK_ROOT}" 2>> $LOG_FILE && cvs co -r $REPORTLIB_TAG quality/autotest/reportlib/cpp 2>> $LOG_FILE
  cd "${BTEST_WORK_ROOT}" 2>> $LOG_FILE && svn co https://svn.baidu.com/quality/autotest/tags/reportlib/cpp/$REPORTLIB_TAG quality/autotest/reportlib/cpp
  if [ $? -ne 0 ];then
    WriteLog $CRITICAL "reportlibÇ©³öÊ§°Ü"
    return 1
  else
    ROLLBACK_LIST[3]=1
  fi

  #±àÒëreportlib
  cd "${BTEST_WORK_ROOT}"/quality/autotest/reportlib/cpp 2>> $LOG_FILE && make 2>> $LOG_FILE
  if [ $? -ne 0 ];then
    WriteLog $CRITICAL "reportlib±àÒëÊ§°Ü"
    return 1
  fi
  
  #±àÒëgtest
  cd "${BTEST_WORK_ROOT}"/com/btest/gtest 2>> $LOG_FILE && sh build.sh 2>> $LOG_FILE
  if [ $? -ne 0 ];then
    WriteLog $CRITICAL "gtest±àÒëÊ§°Ü"
    return 1
  fi

  return 0
}

Main()
{
  if [ $MAC_BIT -eq 32 ]
  then
    WriteLog $INFO "BTestÔİÊ±²»Ö§³Ö32Î»»úÆ÷!"
    return 2
  fi

	#²ÎÊı´¦Àí²¿·Ö

	#-d¹¤×÷Ä¿Â¼WORK ROOT
	local opt_gtest_core_dir=""
	
	#¿ªÊ¼Ñ­»·´¦Àí²ÎÊı
	while [ $# -gt 0 ]
	do
		case "$1" in
			-v) Version
				shift
				;;
			-h) Usage
				shift
				;;
			#-d ¹¤×÷Ä¿Â¼£¬Ä¬ÈÏÎª$HOME
			-d)	ProcessParam 1 "$1" "$2" opt_gtest_core_dir
				shift $?
				;;
			#-f Èç¹ûsvn workspace dirÖĞÏàÓ¦gtestÄ¿Â¼ÒÑ´æÔÚ,Ñ¡Ôñ±¸·İ°²×°»òÍË³ö°²×°
			-f)	ProcessParam 1 "$1" "$2" INSTALL_WITH_BACKUP 
				shift $?
				;;
			#-V Ö±½ÓÖ¸¶¨°²×°Ä¿Â¼
			-V)	ProcessParam 1 "$1" "$2" VALGRIND_INSTALL_DIR
				shift $?
				;;
			*)  echo "Unkown option \"$1\""
				Usage
				;;
		esac
	done

	#Èç¹ûWORK ROOTÎª¿Õ
	if [ -z $opt_gtest_core_dir ]
	then
    local choice
    until [ "$choice" == "Y" ] || [ "$choice" == "y" ] || [ "$choice" == "N" ] || [ "$choice" == "n" ]
    do
      Print $TTY_INFO "ÄúÃ»ÓĞÖ¸¶¨±¾µØSVN¹¤×÷Ä¿Â¼£¬ÏÖÔÚÊ¹ÓÃ¾ø¶ÔÂ·¾¶½øĞĞÖ¸¶¨?(y/n)" 0
      read choice
    done
    if [ "$choice" == "Y" ] || [ "$choice" == "y" ]
    then
      #WORK_ROOT±ØĞëÎªÒ»¸ö¾ø¶ÔÂ·¾¶
      until [ "${opt_gtest_core_dir:0:1}" == "/" ]
      do 
        Print $TTY_INFO "ÇëÊäÈëÄú±¾µØSVN¹¤×÷Ä¿Â¼µÄ¾ø¶ÔÂ·¾¶:" 0
        read opt_gtest_core_dir
        local btest_dir_len=`expr length "$HOME/btest"`
        if [ "$HOME/btest" == "${opt_gtest_core_dir:0:$btest_dir_len}" ];then
          Print $TTY_INFO "×¢Òâ:ÊäÈëµÄÂ·¾¶²»ÄÜÊÇ${HOME}/btestÄ¿Â¼¼°Æä×ÓÄ¿Â¼"
          opt_gtest_core_dir=""
        fi
      done
    else
      opt_gtest_core_dir=$HOME
    fi
  else
    if [ "${opt_gtest_core_dir:0:1}" != "/" ]
    then
      WriteLog $INFO "Ö¸¶¨µÄ±¾µØSVN¹¤×÷Ä¿Â¼±ØĞëÎª¾ø¶ÔÂ·¾¶"
      return 1
    fi
	fi
  WriteLog $INFO "ÄúÉèÖÃµÄ±¾µØSVN¹¤×÷Ä¿Â¼Îª${opt_gtest_core_dir}"
  
  BTEST_WORK_ROOT="`dirname $opt_gtest_core_dir`/`basename $opt_gtest_core_dir`"
  GTEST_HOME="${BTEST_WORK_ROOT}/${GTEST_DIR}"/output
  
  #´Ósvn¿âÖĞcheckout³ögtest
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

      #½«BTESTÖĞµÄ»·¾³±äÁ¿$WORK_ROOT,$BTEST_HOME,$GTEST_HOME,$LD_LIBRARY_PATHĞ´Èë½.bash_profileÖĞ
      WriteLog $INFO "¿ªÊ¼ÉèÖÃ»·¾³±äÁ¿..."
      SetEnvVar "BTEST_WORK_ROOT" "$BTEST_WORK_ROOT" 1
      SetEnvVar "BTEST_HOME" "$HOME/btest" 1
      SetEnvVar "GTEST_HOME" "$GTEST_HOME" 1
      SetEnvVar "LD_LIBRARY_PATH" '$GTEST_HOME/lib'
      SetEnvVar "PATH" '$BTEST_HOME/bin'
      
      WriteLog $INFO "¼ì²âvalgrind..."
      local valgrind_is_ok=1
      local version
      version=`valgrind --version 2>/dev/null`
      if [ $? -ne 0 ]
      then
        valgrind_is_ok=0
        WriteLog $ERROR "valgrindÃ»ÓĞ°²×°£¬½«ÎŞ·¨Ê¹ÓÃBTESTµÄvalgrind¼ì²â¹¦ÄÜ!" 0
      else
        file_valgrind="$(file -L $(which valgrind))" 
        tool_bit=`echo $file_valgrind | grep "ELF ${MAC_BIT}-bit LSB executable"`
        if [ -z "$tool_bit" ]
        then
          valgrind_is_ok=0
          WriteLog $ERROR "Äú°²×°µÄvalgrindÓë»úÆ÷µÄÎ»Êı²»·û£¬½«ÎŞ·¨Ê¹ÓÃBTESTµÄvalgrind¼ì²â¹¦ÄÜ" 0
        else
          if [[ $version < "valgrind-3.4.0" ]]
          then
            valgrind_is_ok=0
            WriteLog $ERROR "Äú°²×°µÄvalgrind°æ±¾Ì«µÍ,½¨ÒéÊ¹ÓÃvalgrind-3.4.0(º¬)ÒÔÉÏ£¬½«ÎŞ·¨Ê¹ÓÃBTESTµÄvalgrind¼ì²â¹¦ÄÜ" 0
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
            Print $TTY_INFO "Ã»ÓĞ¼ì²âµ½ÊÊºÏbtestµÄvalgrind°æ±¾£¬ÊÇ·ñ°²×°ºÏÊÊµÄvalgrind?(y/n)" 0
            read choice
          fi
        done

        if [ "$choice" == "Y" ] || [ "$choice" == "y" ]
        then
          WriteLog $INFO "¿ªÊ¼ÏÂÔØvargrind°²×°ÎÄ¼ş..." 
          cd "$PRESENT_DIR" && wget "$BTEST_SITE$VALGRIND_PACKAGE" >> $LOG_FILE 2>&1
          if [ $? -ne 0 ]
          then
            WriteLog $ERROR "ÏÂÔØvalgrind°²×°ÎÄ¼şÊ§°Ü"  
          else
            WriteLog $INFO "ÏÂÔØvalgrind°²×°ÎÄ¼ş³É¹¦"  
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
                  Print $TTY_INFO "ÇëÊäÈëÓĞĞ´ÈëÈ¨ÏŞµÄvalgrind°²×°Ä¿Â¼µÄ¾ø¶ÔÂ·¾¶: " 0
                  read valgrind_install_dir
                fi
                [ "${valgrind_install_dir:0:1}" == "/" ] && break
              done

              if [ ! -d "${valgrind_install_dir}" ]
              then
                mkdir -p "${valgrind_install_dir}" >> $LOG_FILE 2>&1
                if [ $? -ne 0 ]
                then
                  WriteLog $ERROR "´´½¨valgrind°²×°Ä¿Â¼${valgrind_install_dir}Ê§°Ü"
                else
                  WriteLog $INFO "´´½¨valgrind°²×°Ä¿Â¼${valgrind_install_dir}³É¹¦"
                fi
              fi

              if [ -w "${valgrind_install_dir}" ]
              then
                break
              else
                [ -d "${valgrind_install_dir}" ] && WriteLog $ERROR "ÄúÊäÈëµÄvalgrind°²×°Ä¿Â¼Ã»ÓĞĞ´ÈëÈ¨ÏŞ!"
              fi
            done

            WriteLog $INFO "¿ªÊ¼°²×°valgrind¹¤¾ß,ÇëÄÍĞÄµÈ´ı..."
            cd "$PRESENT_DIR" && tar -jxvf "$VALGRIND_PACKAGE" && cd valgrind-3.5.0 && ./configure --prefix="${valgrind_install_dir}" && make && make install >> $LOG_FILE 2>&1
            if [ $? -ne 0 ]
            then
              WriteLog $ERROR "°²×°valgrindÊ§°Ü"
            else
              WriteLog $INFO "Ğ´ÈëvalgrindµÄ»·¾³±äÁ¿" 0
              if [ "$HOME" == "${valgrind_install_dir}" ]
              then
                SetEnvVar "PATH" '$HOME/bin'
              else
                SetEnvVar "PATH" "${valgrind_install_dir}/bin" 
              fi
              WriteLog $INFO "°²×°valgrind³É¹¦"
            fi
            cd .. && rm -rvf "$PRESENT_DIR"/valgrind-3.5.0 "$PRESENT_DIR/$VALGRIND_PACKAGE" >> $LOG_FILE 2>&1
          fi
        else
          WriteLog $ERROR "Äú½«ÎŞ·¨Ê¹ÓÃBTESTµÄvalgrind¼ì²â¹¦ÄÜ"
        fi
      fi
      
      WriteLog $INFO "¼ì²âccoverÊÇ·ñ´æÔÚ..."
      which covc >/dev/null 2>&1
      if [ $? -ne 0 ]
      then
        WriteLog $ERROR "ccoverÃ»ÓĞ°²×°£¬½«ÎŞ·¨Ê¹ÓÃBTESTµÄ´úÂë¸²¸ÇÂÊ·ÖÎö¹¦ÄÜ"
      fi

      WriteLog $INFO "Æô¶¯×Ô¶¯¸üĞÂ..." 0
      local btest_crontab="/tmp/btest_crontab_"`whoami`
      local btest_crontab_new="${btest_crontab}_new"
      crontab -l > $btest_crontab
      echo "00 01 * * * source $HOME/.bash_profile;$HOME/btest/bin/update_btest" >> $btest_crontab
      crontab -r >/dev/null 2>&1
      echo -n > "${btest_crontab_new}"
      while read -r line
      do
        #È¥³ı¾É°æ±¾ÖĞµÄÃüÁî
        if [ "$line" == "00 13 * * * python $HOME/btest/bin/update_btest.py" ]
        then
          continue
        fi

        #È¥³ıÖØ¸´µÄÃüÁî
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
        WriteLog $ERROR "Æô¶¯×Ô¶¯¸üĞÂÊ§°Ü"
      fi
      rm -rvf $btest_crontab_new >>$LOG_FILE 2>&1

      WriteLog $INFO "BTEST-${VERSION}°²×°³É¹¦"
      local banner="ÇëÊ¹ÓÃÒÔÏÂÃüÁîÊ¹BTEST°²×°ÉúĞ§:"
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
    #°²×°³É¹¦,É¾³ı±¸·İÎÄ¼ş
    #[ -d "$HOME/btest_btestbak" ] && rm -rvf ~/btest_btestbak >> $LOG_FILE 2>&1
    #[ -d "$HOME/.btest_btestbak" ] && rm -rvf ~/.btest_btestbak >> $LOG_FILE 2>&1
    #[ -d "${GTEST_HOME}_btestbak" ] && rm -rvf ${GTEST_HOME}_btestbak >> $LOG_FILE 2>&1

    #°²×°³É¹¦ºóÁ¢¼´Ö´ĞĞÒ»´Î¸üĞÂ
    WriteLog $INFO "BTESTÕıÔÚÉı¼¶ÖĞ£¬´óÔ¼Ğè3-5·ÖÖÓ£¬Çë²»ÒªÊ¹ÓÃCtrl+CÇ¿ĞĞÖÕÖ¹!"
    result=`source ~/.bash_profile;~/btest/bin/update_btest >/dev/null 2>&1`
    if [ $? -ne 0 ]
    then
      echo "$result" >> $LOG_FILE
    fi
    ;;

  1)
    #°²×°Ê§°Ü,»Ø¹öÄ¿Â¼
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
    SendMail "btest-mon@baidu.com" "[BTest]°²×°Ê§°Ü" "" attach
    ;;

  *)
    ;;
esac

WriteLog $INFO "ÈçÓĞÎÊÌâ£¬ÇëÁªÏµbtest@baidu.com,Ğ»Ğ»!"

#ÇåÀí»·¾³
CleanEnv
