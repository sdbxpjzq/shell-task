#!/bin/bash


expday=`date -d '2020-11-03 14:00:00' +%s`
echo $expday

# 在控制请求几次
count=0;
for((i=1;;i++));
do
#当前时间 对应的秒时间戳
current=`date +%s`;
if [ $current -ge $expday ]; then

 	 # 执行程序
 	let count+=1;
 	echo $count;
 	if [ $count -eq 5 ]; then
 		break;
 	else
 	  sleep 0.100
 		continue;
 	fi
else
	continue
fi
done

