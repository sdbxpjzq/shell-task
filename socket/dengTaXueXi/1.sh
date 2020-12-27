#!/bin/bash
declare -A myMap
# Map(courseId, time(分))
myMap["3105796483580928"]=114 # 19 2 学时
#myMap["2610461447472128"]=100 # 20 2学时
myMap["2982960448340992"]=3 # 21 0.5学时
myMap["2467845262476288"]=48 # 22 1学时
myMap["2806039901668352"]=5 # 23 0.5学时
myMap["2629726308713472"]=7 # 24 0.5学时



sendMsg(){
  info=$1
  courseId=$2
  code=`echo $info|awk -F ':' '{print $2}'`
  #对响应码进行判断
    if [ "$code" == "true}" ];then
        echo "请求成功，响应码是$code"
        curl -X POST \
  http://127.0.0.1:8888/api/demo/email/send \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'postman-token: 177789f7-0eb8-3337-8a4e-214208ccc5c1' \
  -d 'subject="灯塔课程_'$courseId'_执行成功"&text="'$info'"'
    else
      echo "请求失败，响应码是$code"
        curl -X POST \
  http://127.0.0.1:8888/api/demo/email/send \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'postman-token: 177789f7-0eb8-3337-8a4e-214208ccc5c1' \
  -d 'subject="灯塔课程_'$courseId'执行失败"&text="'$info'"'
    fi
  sleep ${myMap[$courseId]}
}

for courseId in ${!myMap[*]};do
#   todo 注意拼接方式
  echo '{"courseId": "'$courseId'"}'
  echo ${myMap[$courseId]}
# todo start请求
{
  info=`curl 'https://dyjy.dtdjzx.gov.cn/api/study/start' -H 'sec-fetch-mode: cors' -H 'origin: https://dyjy.dtdjzx.gov.cn' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: zh-CN,zh;q=0.9' -H 'x-requested-with: XMLHttpRequest' -H 'cookie: info=login; Hm_lvt_d652361e289e90df5f0bacaa8bf8cf2b=1604976490,1604980414,1604991548; Hm_lpvt_d652361e289e90df5f0bacaa8bf8cf2b=1604991548; _cs=26d210bf-e983-4a22-a1f1-9e323b145209' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.87 Safari/537.36' -H 'content-type: application/json;' -H 'accept: application/json, text/plain, */*' -H 'referer: https://dyjy.dtdjzx.gov.cn/' -H 'authority: dyjy.dtdjzx.gov.cn' -H 'sec-fetch-site: same-origin' --data-binary '{"courseId": "'$courseId'","userId":"8172599022522486784"}' --compressed`
  sleep `expr ${myMap[$courseId]} \* 60`
#  通知
# todo start请求
  curl 'https://dyjy.dtdjzx.gov.cn/api/study/start' -H 'sec-fetch-mode: cors' -H 'origin: https://dyjy.dtdjzx.gov.cn' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: zh-CN,zh;q=0.9' -H 'x-requested-with: XMLHttpRequest' -H 'cookie: info=login; Hm_lvt_d652361e289e90df5f0bacaa8bf8cf2b=1604976490,1604980414,1604991548; Hm_lpvt_d652361e289e90df5f0bacaa8bf8cf2b=1604991548; _cs=26d210bf-e983-4a22-a1f1-9e323b145209' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.87 Safari/537.36' -H 'content-type: application/json;' -H 'accept: application/json, text/plain, */*' -H 'referer: https://dyjy.dtdjzx.gov.cn/' -H 'authority: dyjy.dtdjzx.gov.cn' -H 'sec-fetch-site: same-origin' --data-binary '{"courseId": "'$courseId'","userId":"8172599022522486784"}' --compressed
  sleep 5
# todo end 请求
  echo "end 请求结果";
  endinfo=`curl 'https://dyjy.dtdjzx.gov.cn/api/study/end' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Site: same-origin' -H 'Origin: https://dyjy.dtdjzx.gov.cn' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: zh-CN,zh;q=0.9' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.87 Safari/537.36' -H 'Content-Type: application/json;' -H 'Accept: application/json, text/plain, */*' -H 'Referer: https://dyjy.dtdjzx.gov.cn/' -H 'X-Requested-With: XMLHttpRequest' -H 'Cookie: info=login; Hm_lvt_d652361e289e90df5f0bacaa8bf8cf2b=1604976490,1604980414; Hm_lpvt_d652361e289e90df5f0bacaa8bf8cf2b=1604980414; _cs=2e69b534-bedb-4cc1-9d84-4a52f5b2afdd' -H 'Connection: keep-alive' --data-binary '{"courseId": "'$courseId'","userId":"8172599022522486784"}' --compressed`
  sendMsg $endinfo $courseId
}&
# 用{}把循环体括起来，后加一个&符号，代表每次循环都把命令放入后台运行
#一旦放入后台，就意味着{}里面的命令交给操作系统的一个线程处理了
done

wait            #wait命令表示。等待上面的命令（放入后台的任务）都执行完毕了再往下执行

# todo 全部完成
curl -X POST \
  http://127.0.0.1:8888/api/demo/email/send \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'postman-token: 177789f7-0eb8-3337-8a4e-214208ccc5c1' \
  -d 'subject="灯塔课程_全部执行完成"&text="灯塔课程_全部执行完成"'



