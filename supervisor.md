supervisor是一个进程管理工具,用来启动,停止,重启和监测进程.可以实现诸如检测某个进程,一旦其被杀死就重启的功能.

## 参考  
https://www.jianshu.com/p/03619bf7d7f5

## 安装  
>sudo pip install supervisor

## 通过echo_supervisord_conf 命令生成配置文件  
>echo_supervisord_conf > /etc/supervisord.conf

## 配置文件加入program配置文件的地址  
  
```
[include]  
files = /etc/supervisor/*.conf  
```

## 创建program配置文件  
注意把program配置文件放在配置文件中files项下

```
;a_server.conf

[program:a_server] ;程序名  
directory = /root/amazon_server ; 程序的启动目录  
command = python app.py  ; 启动命令，可以看出与手动在命令行启动的命令是一样的  
autostart = true     ; 在 supervisord 启动的时候也自动启动  
startsecs = 5        ; 启动 5 秒后没有异常退出，就当作已经正常启动了  
autorestart = true   ; 程序异常退出后自动重启  
startretries = 3     ; 启动失败自动重试次数，默认是 3   
user = root          ; 用哪个用户启动  
redirect_stderr = true  ; 把 stderr 重定向到 stdout，默认 false  
stdout_logfile_maxbytes = 100MB  ; stdout 日志文件大小，默认 50MB  
stdout_logfile_backups = 10     ; stdout 日志文件备份数  
; stdout 日志文件，需要注意当指定目录不存在时无法正常启动，所以需要手动创建目录（supervisord 会自动创建日志文件）  
stdout_logfile = /root/amazon_server/app.log  

killasgroup=true # 使用uwsgi时需要加上
stopasgroup=true # 使用uwsgi时需要加上
```

## 读取配置  
>supervisord -c /etc/supervisord.conf

## 断开现在的配置  
>unlink /***/supervisor.sock

## supervisorctl  
supervisorctl是supervisord的命令行客户端管理工具，用来管理进程  

>supervisorctl  # 进入交互shell环境  
>reread         #读取配置文件  
>start a_server #启动程序 
>status         # 查看进程状态  
>exit           # 退出  

## 开启多个supervisor
可以通过不同的配置文件来开启多个supervisor,连接方式为
>supervisorctl -c 配置文件

## 注意
更新已有文件时需要先reread,然后add;避免使用reload或update,因为reload和update会重启或载入所有服务
