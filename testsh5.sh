#!/bin/bash

echo  '\033[32m-----------------函数--------------------\033[0m'

#定义
    demoFun(){
        echo "这是我的第一个 shell 函数!"
    }
    echo "-----函数开始执行-----"
    demoFun
    echo "-----函数执行完毕-----"

#函数参数
#注意，$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。
    funWithParam(){
        echo "第一个参数为 $1 !"
        echo "第二个参数为 $2 !"
        echo "第十个参数为 $10 !"
        echo "第十个参数为 ${10} !"
        echo "第十一个参数为 ${11} !"
        echo "参数总数有 $# 个!"
        echo "作为一个字符串输出所有参数 $* !"
    }
    funWithParam 1 2 3 4 5 6 7 8 9 34 73
