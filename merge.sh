#!/bin/bash

SRC="~/go/src/bitbucket.org/applysquare/applysquare-go"
TIME=`date +"%Y%m"`
ALPHA1="alpha_1_$TIME" 
ALPHA2="alpha_2_$TIME" 
BRANCH=$1

echo "[AutoMerge AI]"
echo "[AutoMerge AI]进入go代码目录，自动清理环境"
cd ~/go/src/bitbucket.org/applysquare/applysquare-go
git reset --hard
git clean -df

echo "[AutoMerge AI] 获取目标代码"
git checkout $2
git pull

if [[ $1 == 1 ]] ; then
    git checkout $ALPHA1
fi

if [[ $1 == 2 ]] ; then
    git checkout $ALPHA2
fi

git reset --hard
git clean -df

echo "[AutoMerge AI] 更新远程代码"
git pull 
echo "Merge Branch"

echo "[AutoMerge AI] 合并"
git merge $2

echo "[AutoMerge AI] 推送"
git push
echo "[AutoMerge AI]"

