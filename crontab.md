## 简介  
cron是一个linux下 的定时执行工具，可以在无需人工干预的情况下运行作业  
- /sbin/service crond start    //启动服务  
- /sbin/service crond stop     //关闭服务  
- /sbin/service crond restart  //重启服务  
- /sbin/service crond reload   //重新载入配置  
- /sbin/service crond status   //查看服务状态   

## 写法  
minute hour day-of-month month-of-year day-of-week who command

### 举例  
12,24 12 * * * root haha.sh # 以root身份每天12点12分和24分执行haha.sh  
/2 * * * * * root haha.sh # 每两分钟执行haha.sh  

## 命令  
crontab -e            # 进入用户.cron文件来编辑
crontab -l [-u USER]  # 查看用户(默认为当前用户)的文件 


## 经典错误
premature EOF -> 末尾加一空白行

## 注意
crontab xxx.cron # 这条命令会覆盖当前用户的cron文件,不要随便使用
