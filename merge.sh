#!/bin/bash

SRC="~/www/teaching"
ALPHA="alpha_$1"

echo "\033[32m[--- 进入teaching代码目录，自动清理环境 ---]\033[0m"
cd SRC
#git reset --hard
#git clean -df

echo "\033[32m[--- 切换到目标代码分支 ---]\033[0m"
git checkout $2
git add .
git commit -a
git pull origin $ALPHA
git push origin $2

echo "\033[32m[--- 切换到测试代码分支 自动清理环境 ---]\033[0m"
git checkout $ALPHA
git reset --hard
git clean -df

echo "\033[32m[--- 拉取远程代码 origin/$ALPHA --->>> $ALPHA ---]\033[0m"
git pull origin $ALPHA

echo "\033[32m[---  合并$2 --->>> $ALPHA ---]\033[0m"
git merge $2

echo "\033[32m[--- 推送$ALPHA --->>> origin/$ALPHA ---]\033[0m"
git push origin $ALPHA

git checkout $2
echo "\033[32m[--- OK ---]\033[0m"

if [[ -n $3 && $3 = '-d' ]];then
    echo
    sh origin-deploy.sh $ALPHA alpha $2
fi
