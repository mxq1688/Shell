#!/bin/bash
  #设置该选项后，当脚本在执行过程中尝试使用未定义过的变量时，报错并退出运行整个脚本（默认会把该变量的值当作空来处理），这个感觉也非常有用，有些时候可能在脚本中变量很多很长，疏忽了把某个变量的名字写错了，这时候运行脚本不会报任何错误，但结果却不是你想要的，排查起来很是头疼，使用这个选项就完美的解决了这个问题。
  set -u     

#获取镜像tag
RESULT=$(curl  -k -s domin/v2/$IMAGE/tags/list)
TAGS=$(echo ${RESULT} | jq -r '.tags[]' ) 
arr=($TAGS)
index=${#arr[@]}-2
COMMIT_NUMBER=${arr[$index]}