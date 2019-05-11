## 作用  
linux下用来在后台执行程序  

## 指令   
nohup CMD < INPUT > STDOUT 2> STDERR

## 举例  
nohup ./xixi.sh > /dev/null 2>&1 &   # /dev/null表示输出到外太空

## 查看后台运行的程序  
ps -aux # a表示all, u表示按照user, x表示不以终端机来区分
