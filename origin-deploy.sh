#!/bin/bash

SRC="~/www/teaching"
ALPHA_DEV=$1
ALPHA=$2
DEV=$3
if [ -z $ALPHA_DEV ];then
   echo "\033[32m[--- Parameter error！ ---]\033[0m"
   exit
fi

if [ !$ALPHA ];then
    ALPHA='alpha'
fi

git checkout $ALPHA
git pull origin $ALPHA
git merge $ALPHA_DEV
git push origin $ALPHA

git checkout $DEV

echo "\033[32m[--- 连接测试服务器并部署 ---]\033[0m"
#    sudo /Users/meng/.ssh/login.sh 8022 root 121.196.194.92 Wnuht1uDe7zp  >> /var/www/html/m.log 2>&1
sshpass -pWnuht1uDe7zp  ssh -p8022 root@121.196.194.92 "export PATH=$PATH:/root/.nvm/versions/node/v10.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/n/versions/node/10.0.0/bin/:/opt/node-v10.15.3-linux-x64/lib/node_modules/n/bin/ && cd /root/alpha && /bin/bash run.sh $ALPHA"
exit
