#!/bin/bash
LogSuccess(){
    echo -e "\033[32m $(printf %-4s 'Success: ' $*) \033[0m" $(date "+%Y-%m-%d %H:%M:%S")
}
LogError(){
    echo -e "\033[31m $(printf %-4s 'Error: ' $*) \033[0m" $(date "+%Y-%m-%d %H:%M:%S")
}
LogWarning(){
    echo -e "\033[33m $(printf %-4s 'Warning: ' $*) \033[0m" $(date "+%Y-%m-%d %H:%M:%S")
}
# 闪烁tip window下貌似没用
LogTip(){
    echo -e "\033[33;5m $(printf %-4s 'Tip: ' $*) \033[0m" $(date "+%Y-%m-%d %H:%M:%S")
}
Log(){
    msgs=''
    for msg in $*;do 
        msgs+=' '$msg  
    done
    echo -e "\033[34m Log: $msgs \033[0m" $(date "+%Y-%m-%d %H:%M:%S")
}

servicePathName="neobpback"

if(($1));then
    servicePathName=$1
fi

workdir=$(cd $(dirname $0); pwd) 

path="${workdir}/../${servicePathName}"
servicePath=$(cd $path;pwd)

cd $workdir"/../$servicePathName"

git status
Log "'git pull ' $servicePath"
git pull

sh $workdir/web/build.sh

sh $workdir/admin/build.sh

git add .
git commit -m 'chore:前端代码打包'
git push 

echo $(date "+%Y-%m-%d %H:%M:%S") > version.txt
exit




