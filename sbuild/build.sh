#!/bin/bash
# 定义日志输出
:<<EOF
    Log(){
        msgs=''
        for msg in $*;do 
            msgs+=' '$msg  
        done
        echo $msgs $(date "+%Y-%m-%d %H:%M:%S")
        # 或者
        # printf %s $*
    }
EOF
# 定义颜色变量，\033、\e、\E是等价的，都是转义起始符
# echo -e "\033[字背景颜色;文字颜色m字符串\033[0m" 
# 字体颜色： 黑30m 红31m 绿32m 黄33m 蓝34m 紫35m 天蓝36m 白37m 
# 背景色：  黑40 红41 绿42 黄43 蓝44 紫45 天蓝46 白47

LogError(){
    echo -e "\033[41;37m ERROR \033[0m" $(printf %-4s $*) ---$(date "+%Y-%m-%d %H:%M:%S")
}
LogSuccess(){
    echo -e "\033[42;37m DONE \033[0m" $(printf %-4s $*) ---$(date "+%Y-%m-%d %H:%M:%S")
}
LogWarning(){
    echo -e "\033[43;37m ERROR \033[0m" $(printf %-4s $*) ---$(date "+%Y-%m-%d %H:%M:%S")
}
LogInfo(){
    echo -e "\033[44;37m INFO \033[0m" $(printf %-4s $*) ---$(date "+%Y-%m-%d %H:%M:%S")
}
# 闪烁tip window下貌似没用
LogTip(){
    echo -e "\033[33;05m $(printf %-4s 'Tip: ' $*) \033[0m" $(date "+%Y-%m-%d %H:%M:%S")
}

# 定义要移动的路径数组  判断如果有参数使用参数
pathArr=('neobpback/neobp-web/neobp-web-app/src/main/webapp')

# 获取脚本文件所在路径 $(pwd)  echo $(dirname $0)
workdir=$(cd $(dirname $0); pwd)   
copyPathArr=()

# 获取命令行参数个数 $# or ${#*}    获取值 $* $@  ${*} ${@}
if(($#>0))
then
    i=0
    for p in $*;do
        path="${workdir}/../../$p"
        # 数组赋值
        copyPathArr[${i}]=$(cd $path;pwd)
        let i++
    done
else
    for((i=0;i<${#pathArr[*]};i++));do
        path="${workdir}/../../${pathArr[${i}]}"
        # 数组赋值
        copyPathArr[${i}]=$(cd $path;pwd)        
    done
fi

LogTip ${copyPathArr[@]}

time1=$(date "+%Y%m%d%H%M%S")
Log "build to dist "

cd $workdir  # 作用是在其他地方执行脚本  cd `dirname $0`
npm run build    #echo $(cd $workdir; npm run build)
time2=$(date "+%Y%m%d%H%M%S")
LogSuccess "build finished! --->>> dist "
LogTip "打包耗时：$(((time2-time1)/60))  Min"
timeDiff=$((time2-time1))
timeDiffMin=$(awk 'BEGIN{printf "%.1f\n",'$timeDiff'/'60'}')
LogTip "打包耗时：$timeDiffMin  Min"
echo $(date "+%Y-%m-%d %H:%M:%S") > version.txt
# 删除文件 copy
for path in ${copyPathArr[*]}
do
    file="$path/index.html"
    if [ -e $file ]
    then
        rm $file
        if(($?==0));then
            LogSuccess $file'删除成功'
        else
            LogError $file'删除成功'
        fi
    else
        LogWarning "文件不存在（$path/index.html）"
    fi
    dir="$path/static"
    if [ -e $dir ]
    then
        rm -rf $dir
        if(($?==0));then
            LogSuccess $dir'删除成功'
        else
            LogError $dir'删除成功'
        fi
    else 
        LogWarning "文件夹不存在（$dir）"
    fi
done

# 复制文件
for path in ${copyPathArr[*]}
do
    file="$workdir/dist/index.html"
    if [ -e $file ]
    then
        cp $file $path
        if(($?==0));then
            LogSuccess "复制成功（$file -->> $path）"
        else
            LogError "复制成功（$file -->> $path）"
        fi
    else
        LogWarning "文件不存在（$workdir/index.html）"
    fi
    dir="$workdir/dist/static"
    if [ -e $dir ]
    then
        cp -rf $dir $path
        if(($?==0));then
            LogSuccess "复制成功（$dir -->> $path）"
        else
            LogError "复制成功（$dir -->> $path）"
        fi
    else 
        LogWarning "文件夹不存在（$workdir）"
    fi
done

# echo "copy dist--->>> 目标路径" 尝试下是否能覆盖，减少资源浪费
exit