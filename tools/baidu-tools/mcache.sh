for i in `cat cachelist`
do
    echo $i
    ssh $i 'cd /home/work/cacheserver/conf; rm cacheserver.conf.bak; cp cacheserver.conf cacheserver.conf.bak;'
    scp cacheserver.conf "$i:/home/work/cacheserver/conf/cacheserver.conf"
    ssh $i 'cd /home/work/cacheserver/ && ./bin/cacheserver_control restart'
    sleep 20
done
