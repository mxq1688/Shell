#!/bin/bash
:<<EOF
    EOF可以使用其他字符
    多行注释
EOF
# sh -n m.sh 检查脚本是否错误
#同一行多个命令要加;

echo -e '\033[32m-------------------------------------\033[0m'

#变量操作
#    #定义变量 1、中间不能有空格
#        name='anh fy mxq'
#    #只读变量
#    #    readonly name
#    #使用变量 1、加上$
#    #    echo $name
#    #删除变量 1、unset 命令不能删除只读变量。
#        #unset name

#    #拼接字符串
#    echo 'abc' 'def'
#    #其他使用变量方式
#    echo ''$name'' //单引号解析变量的方法
#    echo "$name"
#    echo "${name}"

#    #获取字符串长度
#    echo ${#name}
#    #截取字符串
#    echo ${name:1:5}

echo -e '\033[32m-------------------------------------\033[0m'

#数组 shell只支持一维数组
    arr=(a b c d e)
    #读取数组元素
    echo ${arr[0]}
    echo ${arr[@]} #or ${arr[*]}
    #获取数组元素个数
    echo ${#arr[@]} #or ${#arr[*]}
    #获取数组单个元素的长度
    echo ${#arr[1]}

    # 数组遍历
        for p in ${arr[*]};do 
        done

        for((i=0;i<${#arr[*]};i++));do
        done



# 获取当前文件路径
echo $(pwd)
echo $(dirname $0) # echo `dirname $0`
echo $(cd $(dirname $0); pwd)