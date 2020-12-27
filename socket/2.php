<?php
set_time_limit(0);

//ob_start();
//$str = str_repeat(' ', 1024);
////echo $str,'<br/>';
////ob_flush();
////flush();
////
////
$i = 1;
while (1) {
    $str = str_repeat(" ",9999999); // 确保足够的字符,立即输出
    echo $str, '<br/>';
    echo $i++, '<br/>';
    ob_flush();
    flush();
    sleep(1);
}
