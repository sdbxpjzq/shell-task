#!/bin/bash


expday=`date -d '2020-12-31 14:00:00' +%s`
echo $expday

# 在控制请求几次
count=0;
for((i=1;;i++));
do
#当前时间 对应的秒时间戳
current=`date +%s`;
if [ 1 -eq 1 ]; then
#  抢鸡蛋券
 curl -X GET "https://s.m.jd.com/activemcenter/mfreecoupon/getcoupon?key=1cf232e92dae42b592428639e40a7cc7&roleId=43567210&to=https%3A%2F%2Fitem.jd.com%2F46548918620.html&_stk=key%2CroleId%2Cto&_ste=1&h5st=20201217114414701%3B5095519053741026%3B10014%3Btk01w82091b95a8nNlJza3ZPRFdZLDfaiic4hIF8%2FYDra31Mt%2BE367b0z3m3EuGO633WYd%2Bh9FfCtmzddMblrcwnLqoC%3B9e787a294f4a19e0be1a4efe9fb2241c073a8e4893772edc160af862e7656ac1&_=1608176654711&sceneval=2&g_login_type=1&callback=jsonpCBKB&g_ty=ls" -H "host: s.m.jd.com" -H "cookie: __jd_ref_cls=MProductCoupon_WaitGetCoupon; mba_muid=1604246557370569576898.4615.1608176654695; mba_sid=4615.20; unpl=V2_ZzNtbRFWEUAmXBMEK0xeB2IAQlsSVUsWIl8RVCxJXwQwARpYclRCFnQURldnGVoUZwMZXUJcRhRFOEZVehhdDG8KGl9yV0cTGwkoVHIcMmtiBkJbQgJAFHRYRFUrSwxVVzMRXXJXQiV1D0ddex9ZAm8LFFRGUkAdcABBUngpbAVvByJtlf7tw%252fmuku3Rzu6HVwcUXkRTQhR0C3ZVSxhsTgkCX11FVkoVcw1BXHMfVQFiABpYSlBFFkUJdlc%253d%7CV2_ZzNtbUVfRhRxC0YAeBsJBWJTQggSUUITIV1ABnhLXFBkBkdbclRCFnQURldnGVsUZgQZWEpcQRBFCEJkexhdBGUHFFRCV3MlfGZFVnMcVAxmAxszQlZCezNWBREiShhNVwASbUNnRhB9D0QBfUpaBzUARVgVABAUcQtGVHIbVFE3ChMNElVDEHMPFFZ5GGw1bgIiXUNWQhR8AERReh9cNWEHFF1BX0UTcmYaZHopXTVmM0QzQlZCFHcJR1x6GREAYgsVXxdREBN3WkUDfk4LVmYHEV1CXkEdIVhPVStJXgViBRUPQFVCJXQ4Rg%253d%253d; PPRD_P=UUID.1604246557370569576898-LOGID.1608104410498.502170721-CT.138920.18.71-EA.17005.2.238; __jda=64921067.1604246557370569576898.1604246557.1608174701.1608176510.590; __jdb=64921067.16.1604246557370569576898|590.1608176510; __jdc=64921067; __jdv=64921067%7Ckong%7Ct_1000089893_157_0_184__44a71d200a30acaa%7Ctuiguang%7Cb0cdbedaad3342a7a392fff1fa20f394%7C1608174700000; __jxjda=64921067.1604246557370569576898.1604246557.1608173109.1608176501.463; __wga=1608176635490.1608176501345.1608173109551.1605021059266.4.59; cid=8; jxsid_s_t=1608176635531; jxsid_s_u=https%3A//coupon.m.jd.com/coupons/show.action; retina=1; shshshfp=7642cf1924484a6b439ee38945b18dc5; shshshfpa=c47465f2-d9c3-8d40-de7c-28a2c1f47c45-1568758477; shshshfpb=04137af3b00745026580a1e08ad19416ab99aeb76fa253e075b0804f89; shshshsID=5431f6f3be9a961851dda8646763626f_10_1608176635696; wqmnx1=MDEyNjM1MGg6dW1jb3N3aWVmOTQyM2EmSTUwaDplLjQ5MGw9MzI9MyYyY2E1MjlhXz0wNTI1NTBkaWUuLjliZjA4ODEzZWtpRDAtLS0tMDZ1dGUwVS9zeW9pZWFzMTQ7b3MvcGQ0dXRzL1Nyay8vLnAvU2xpZmV3cnIvc242NzQ1MzA0Mzhka3QwOTc4NDIwfHViZTM3ZmE5MDdkcHZJYTIzMC5TMmk1aWVVb1MyZSApbEswMUggIG9iMThwRC8yczRVLTUxT0NIKigp; wxa_level=1; pt_key=app_openAAJfnt0AADCBic8QNVkZ943hPL8pD3oVlWrs_kOkuM2s21REqf9rCrza0M2-kfw867isQJddDSs; pt_pin=sdbxpjzq; pwdt_id=sdbxpjzq; sid=25e46cc796ac5285e39b2f94c989a4aw; __jdu=1604246557370569576898; sc_width=414; wq_area=1_2802_0%7C2; jxsid=16081669808352139503; _mkjdcn=f1e90f8de9b8cc0610987cc98a90094a; addrId_1=2387709517; mitemAddrId=13_1090_1095_39374; mitemAddrName=%u5C71%u4E1C%u6EE8%u5DDE%u5E02%u535A%u5174%u53BF%u57CE%u533A%u4E50%u5B89%u5927%u8857%u5929%u5143%u7687%u5BB6%u516C%u9986B14%u697C2%u5355%u51431001%u5BA4%uFF08%u8BF7%u63D0%u524D%u6253%u7535%u8BDD%u786E%u8BA4%u662F%u5426%u5728%u5BB6%uFF09; wq_addr=2387709517%7C13_1090_1095_39374%7C%u5C71%u4E1C_%u6EE8%u5DDE%u5E02_%u535A%u5174%u53BF_%u57CE%u533A%7C%u5C71%u4E1C%u6EE8%u5DDE%u5E02%u535A%u5174%u53BF%u57CE%u533A%u4E50%u5B89%u5927%u8857%u5929%u5143%u7687%u5BB6%u516C%u9986B14%u697C2%u5355%u51431001%u5BA4%uFF08%u8BF7%u63D0%u524D%u6253%u7535%u8BDD%u786E%u8BA4%u662F%u5426%u5728%u5BB6%uFF09%7C118116173%2C37163021; jcap_dvzw_fp=80d0c5e77683171e2f727eeb71881d06$931910612431; _mkjdcnsl=001; cartLastOpTime=1607901457; cartNum=63; mt_xid=V2_52007VwMVU1hbV10bTR9eA2YHFVpZXlVTF0ApVQdiABZTXVFOXh9ITkAAYgFBTg5ZVlwDQR9bA2VQQAAODAZTL0oYXwR7AxFOXVtDWh5CGVsOZgoiUG1aYlkeTxFZAFcBFVFZ; sk_history=100012792902%2C37610781859%2C100001567949%2C100015885104%2C1447894%2C10023178997694%2C100008447371%2C11730953651%2C1447893%2C8753020%2C10023367470694%2C; warehistory=\"100012792902,37610781859,100001567949,100015885104,1447894,10023178997694,100015190434,100008447371,11730953651,1447893,8753020,10023367470694,\"; visitkey=50955190537410269; wq_uits=; dmpjs=; mt_ext=; webp=0; abtest=20201102144012234_74" -H "accept: */*" -H "user-agent: jdapp;iPhone;9.3.0;14.2;44963d7b73c2f4ffb05211839ea80aa31476c330;network/wifi;ADID/4110C8FB-16CA-455A-BE2B-B06B0D1B86B5;supportApplePay/0;hasUPPay/0;hasOCPay/0;model/iPhone9,2;addressid/1389841924;supportBestPay/0;appBuild/167454;pushNoticeIsOpen/0;jdSupportDarkMode/0;pv/4615.19;apprpd/HandSeckill_Main;ref/JDWebViewController;psq/1;ads/;psn/44963d7b73c2f4ffb05211839ea80aa31476c330|14872;jdv/0|kong|t_1000089893_157_0_184__44a71d200a30acaa|tuiguang|b0cdbedaad3342a7a392fff1fa20f394|1608174700;adk/;app_device/IOS;pap/JA2015_311210|9.3.0|IOS 14.2;Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148;supportJDSHWK/1" -H "accept-language: zh-cn" -H "referer: https://coupon.m.jd.com/coupons/show.action?key=1cf232e92dae42b592428639e40a7cc7&roleId=43567210&to=https://item.jd.com/46548918620.html&lng=116.332842&lat=40.039925&sid=25e46cc796ac5285e39b2f94c989a4aw&un_area=1_2800_2851_0"
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

