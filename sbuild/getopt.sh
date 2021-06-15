#!/bin/bash

# getopt是一个外部命令，不是bash内置命令，Linux发行版通常会自带

# getopt支持短选项和长选项

# 老版本的getopt问题较多，增强版getopt比较好用，执行命令getopt -T; echo $?，如果输出4，则代表是增强版的

# 如果短选项带argument且参数可选时，argument必须紧贴选项，如-carg 而不能是-c arg

# 如果长选项带argument且参数可选时，argument和选项之间用“=”，如--clong=arg而不能是--clong arg


#-o或--options选项后面是可接受的短选项，如ab:c::，表示可接受的短选项为-a -b -c，
#其中-a选项不接参数，-b选项后必须接参数，-c选项的参数为可选的
#-l或--long选项后面是可接受的长选项，用逗号分开，冒号的意义同短选项。
#-n选项后接选项解析错误时提示的脚本名字
ARGS=`getopt -o ab:c:: -l along,blong:,clong:: -n "$0" -- "$@"`
if [ $? != 0 ]; then
    echo "Terminating..."
    exit 1
fi

echo ARGS=[$ARGS]
#将规范化后的命令行参数分配至位置参数（$1,$2,...)
eval set -- "${ARGS}"
echo formatted parameters=[$@]

while true
do
    case "$1" in
        -a|--along) 
            echo " a";
            shift
            ;;
        -b|--blong)
            echo " b, $2";
            shift 2
            ;;
        -c|--clong)
            case "$2" in
                "")
                    echo " c, no argument";
                    shift 2  
                    ;;
                *)
                    echo " c, argument $2";
                    shift 2;
                    ;;
            esac
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Internal error!"
            exit 1
            ;;
    esac
done

#处理剩余的参数
echo remaining parameters=[$@]
echo \$1=[$1]
echo \$2=[$2]

# 测试
    #短选项
        # ./getopt.sh -a -b1 -c2 file1 file2
    #长选项
        # ./getopt.sh --along --blong=1 --clong=2 file1 file2
    #长短混合
        # ./getopt.sh -a -b1 --clong=2 file1 file2