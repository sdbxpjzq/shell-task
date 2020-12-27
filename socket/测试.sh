#!/bin/bash

expday=`date -d '2010-11-03 13:11:00' +%s`
echo $expday
#current=1604380364
#echo $current

for((i=1;;i++));
do
#当前时间 对应的秒时间戳
current=`date +%s`;
if [ $current -gt $expday ]; then

 	break;
else
	echo "未到时间";
continue
fi
done
