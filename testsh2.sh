#!/bin/bash

# ``反引号是执行并引用一个命令的执行结果，类似于$(...)
    echo `ls`
    echo $(ls)

echo -e "\033[32m-----------------系统变量--------------------\033[0m"

#系统变量
    # $UID $PWD $PATH
    # $$ 脚本运行的当前进程ID号
    # $! 后台运行的最后一个进程的ID号
    echo $0 #当前文件名
    echo $1 #第一个参数
    echo $2 #第二个参数
    echo $* #所有参数 (不包括文件本身) or $@ 或者 ${*} ${@}
    echo $# #所有参数个数 (不包括文件本身)  或者 ${#*} ${#@}
    echo $? #上一条命令执行状态 0成功
    echo $- #显示Shell使用的当前选项


    #  $* $@   
        # 不同点：只有在双引号中体现出来。
        # echo 直接输出"$*"和"$@"做对比，是看不出区别的
        # "$*"会将所有的参数从整体上看做一份数据，而不是把每个参数都看做一份数据。
        # "$@"仍然将每个参数都看作一份数据，彼此之间是独立的。
        # 假设在脚本运行时写了三个参数 1、2、3，，则 " * " 等价于 "1 2 3"（传递了一个参数），而 "@" 等价于 "1" "2" "3"（传递了三个参数）

echo -e '\033[32m-----------------运算符--------------------\033[0m'

#运算符
    num1=2;num2=3
    echo `expr $num1 + $num2`  #表达式和运算符之间要有空格,例如 2+2 是不对的，必须写成 2 + 2
    echo `expr 2 \* 2`  #乘号(*)前边必须加反斜杠(\)才能实现乘法运算；
    echo $(expr 2 + 2)

    #$(())  $[]用于数学计算
    echo $[ num1 * num2 ] #or $[ $num1 * $num2 ]
    echo $((num1 * num2)) #or $(( $num1 * $num2 ))

echo -e '\033[32m------------------if语句-------------------\033[0m'

    #    ==	相等。用于比较两个数字，相同则返回 true。	[ $a == $b ] 返回 false。
    #    !=	不相等。用于比较两个数字，不相同则返回 true。	[ $a != $b ] 返回 true。

    #关系运算符 关系运算符只支持数字，不支持字符串，除非字符串的值是数字
    #        -eq	检测两个数是否相等，相等返回 true。	[ $a -eq $b ] 返回 false。
    #        -ne	检测两个数是否不相等，不相等返回 true。	[ $a -ne $b ] 返回 true。
    #        -gt	检测左边的数是否大于右边的，如果是，则返回 true。	[ $a -gt $b ] 返回 false。
    #        -lt	检测左边的数是否小于右边的，如果是，则返回 true。	[ $a -lt $b ] 返回 true。
    #        -ge	检测左边的数是否大于等于右边的，如果是，则返回 true。	[ $a -ge $b ] 返回 false。
    #        -le	检测左边的数是否小于等于右边的，如果是，则返回 true。	[ $a -le $b ] 返回 true。

    #字符串运算符
    #    =	检测两个字符串是否相等，相等返回 true。	[ $a = $b ] 返回 false。
    #    !=	检测两个字符串是否相等，不相等返回 true。	[ $a != $b ] 返回 true。
    #    -z	检测字符串长度是否为0，为0返回 true。	[ -z $a ] 返回 false。
    #    -n	检测字符串长度是否为0，不为0返回 true。	[ -n "$a" ] 返回 true。
    #    $	检测字符串是否为空，不为空返回 true。	[ $a ] 返回 true。


    #布尔运算符
    # !	非运算，表达式为 true 则返回 false，否则返回 true。	[ ! false ] 返回 true。
    # -o	或运算，有一个表达式为 true 则返回 true。	[ $a -lt 20 -o $b -gt 100 ] 返回 true。
    # -a	与运算，两个表达式都为 true 才返回 true。	[ $a -lt 20 -a $b -gt 100 ] 返回 false。

    # 逻辑运算符
    # &&	逻辑的 AND	[[ $a -lt 100 && $b -gt 100 ]] 返回 false
    # ||	逻辑的 OR	[[ $a -lt 100 || $b -gt 100 ]] 返回 true

    #文件测试运算符
    # -b file	检测文件是否是块设备文件，如果是，则返回 true。	[ -b $file ] 返回 false。
    # -c file	检测文件是否是字符设备文件，如果是，则返回 true。	[ -c $file ] 返回 false。
    # -d file	检测文件是否是目录，如果是，则返回 true。	[ -d $file ] 返回 false。
    # -f file	检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	[ -f $file ] 返回 true。
    # -g file	检测文件是否设置了 SGID 位，如果是，则返回 true。	[ -g $file ] 返回 false。
    # -k file	检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。	[ -k $file ] 返回 false。
    # -p file	检测文件是否是有名管道，如果是，则返回 true。	[ -p $file ] 返回 false。
    # -u file	检测文件是否设置了 SUID 位，如果是，则返回 true。	[ -u $file ] 返回 false。
    # -r file	检测文件是否可读，如果是，则返回 true。	[ -r $file ] 返回 true。
    # -w file	检测文件是否可写，如果是，则返回 true。	[ -w $file ] 返回 true。
    # -x file	检测文件是否可执行，如果是，则返回 true。	[ -x $file ] 返回 true。
    # -s file	检测文件是否为空（文件大小是否大于0），不为空返回 true。	[ -s $file ] 返回 true。
    # -e file	检测文件（包括目录）是否存在，如果是，则返回 true。	[ -e $file ] 返回 true。

    # 条件语句 条件表达式要放在方括号之间，并且要有空格，例如: [$a==$b] 是错误的，必须写成 [ $a == $b ]。
    #if []   也可以使用if(())  
    # []  (())区别是(())可以使用><符号,不能使用 -a -e等符号
    a=100
    b=200
    if(($a<$b));then
        echo '这是(())用法'
    fi
    if [ $a -gt 5 -a $b -gt 5 ];then
        echo '布尔运算'
    fi

    if [ -e './merge.sh' ];then
        echo 'yes'
    fi
    

echo -e  "\033[32m-----------------逻辑运算符--------------------\033[0m"

    #逻辑运算符
    #        &&	逻辑的 AND	[[ $a -lt 100 && $b -gt 100 ]] 返回 false
    #        ||	逻辑的 OR	[[ $a -lt 100 || $b -gt 100 ]] 返回 true
    if [ $a -gt 10 ] && [ $b -gt 10 ];then
        echo '逻辑运算符';
    fi
      #或者简写
            if [[ $a -gt 10 && $b -gt 10 ]];then
                echo '逻辑运算符';
            fi
    if(($a > 10 && $b > 10 ));then
        echo '逻辑运算符';
    fi
    
      

echo  '\033[32m-----------------test命令--------------------\033[0m'

# test命令 Shell中的 test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。

    num1=100
    num2=100
    #    echo $num1
    #    echo $[num1]
    #    echo ${num1}
    echo `expr $num1 + $num2`
    echo $(expr $num1 + $num2)
    echo $[ num1 * num2 ] #or $[ $num1 * $num2 ]
    echo $((num1 * num2)) #or $(( $num1 * $num2 ))

    if test $num1 -eq $num2
    then
        echo '两个数相等！'
    else
        echo '两个数不相等！'
    fi


