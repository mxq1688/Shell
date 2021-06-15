#!/bin/bash

# getopts是bash的内部命令

# getopts有两个参数，第一个参数是一个字符串，包括字符和“:”

# 每一个字符都是一个有效的选项（option），如果字符后面带有“:”，表示这个选项有自己的argument，argument保存在内置变量OPTARG中

# $OPTIND总是存储原始$*中下一个要处理的元素位置

# 对于while getopts ":a:bc" opt，第一个冒号表示忽略错误


while getopts ":a:bc" opt
do
    case $opt in
        a)
            echo "-a [$OPTARG] OPTIND=[$OPTIND]"
            ;;
        b)
            echo "-b [$OPTARG] OPTIND=[$OPTIND]"
            ;;
        c)
            echo "-c [$OPTARG] OPTIND=[$OPTIND]"
            ;;
        ?)
            echo " unrecognized parameter."
            exit 1
            ;;
    esac
done
#通过shift $(($OPTIND - 1))的处理，$*中就只保留了除去选项内容的参数，
#可以在后面的shell程序中进行处理
shift $(($OPTIND - 1))
echo remaining parameters=[$*]
echo \$1=[$1]
echo \$2=[$2]


# 测试  sh git.sh -a 12 -b -c file1 file2  -a -b -c  #可以不按照顺序