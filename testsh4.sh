#!/bin/bash
echo  '\033[32m-----------------for--------------------\033[0m'

#for
    for var in 1 2 3
    do
        echo $var
    done

    for i in 'this is a truck';do
        echo $i
    done

    for i in `seq 1 3`;do
        echo $i
    done

    j=0
    for((i=0;i<100;i++));do
        j=$[j+ i]
    done
#    echo $j

echo '\033[32m-----------------while--------------------\033[0m'

#while
    i=1
    # []  (())区别是(())可以使用>  <  符号
    while(( $i<=3 ))   #or while [ $i -gt 3 ]
    do
        echo $i
        let "i++"
    done

    while read line;do
        echo $line
    done </etc/hosts

#无线循环
#    while :  #or while true   or for (( ; ; ))
#    do
#        echo 1
#    done

#until 与while相反
#until condition
#do
#    command
#done


echo '\033[32m-----------------case--------------------\033[0m'

#case
    echo '输入 1 到 4 之间的数字:'
    echo '你输入的数字为:'
    read aNum
    case $aNum in
        1)  echo '你选择了 1'
        ;;
        2)  echo '你选择了 2'
        ;;
        3)  echo '你选择了 3'
        ;;
        4)  echo '你选择了 4'
        ;;
        *)  echo '你没有输入 1 到 4 之间的数字'
        ;;
    esac

