#!/bin/bash

#
# 异步执行（wait）使用样例-父脚本
#
# wait加参数是等待某个进程结束，不加参数是等待以上所有后台进程结束


echo "父脚本：启动子脚本.."
./child1.sh &
# 通过将shell参数 $! 赋给pid变量，以记录子进程的进程ID
# pid1=$!

./child2.sh &
# 通过将shell参数 $! 赋给pid变量，以记录子进程的进程ID
# pid2=$!

echo "父脚本：子脚本(PID=${pid1})已启动"
echo "父脚本：子脚本(PID=${pid2})已启动"
echo "父脚本：继续执行中.."
sleep 2

echo "父脚本：暂停执行，等待子脚本执行完毕.."
# wait ${pid1}
# wait ${pid2}
wait
echo "父脚本：子脚本已结束，父脚本继续.."
echo "父脚本：父脚本执行结束。脚本退出！"