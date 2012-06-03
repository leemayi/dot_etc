# from utf-8 to gb2312
for host in `cat list.txt`;
do
    echo $host
    ./change_font <$host |sort |uniq >$host.gbk
done

