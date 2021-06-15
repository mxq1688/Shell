#!/bin/bash

# \n换行  \c不换行

echo -e '\033[32m-----------------echo--------------------\033[0m'

# echo 用法
    echo -e "OK! \n" # -e 开启转义
    echo "It is a test"

    #重定向
    echo "It is a test" > myfile  #创建
    echo "It is a test" >> myfile #追加

echo -e '\033[32m-----------------printf--------------------\033[0m'

#printf
:<<EOF
    %s %c %d %f都是格式替代符
    %-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐），任何字符都会被显示在10个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来。
    %-4.2f 指格式化为小数，其中.2指保留2位小数。
EOF
    # format-string为双引号
    printf "%-5d %s\n" 1 "abc"
    # 单引号与双引号效果一样
    printf '%d %s\n' 1 "abc"
    # 没有引号也可以输出
    printf %s abcdef

    # 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
    printf %s abc def
    printf "%s\n" abc def
    printf "%s %s %s\n" a b c d e f g h i j

    # 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
    printf "%s and %d \n"
 

echo  '\033[32m-----------------test命令--------------------\033[0m'