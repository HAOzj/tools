# 简介  
tmux被称为terminal complexer,作用就是在一个窗口下可以打开多个窗口和切分窗口(叫做panes).  
层次为3级,从高到低位:session,window和pane.  

# 作用  
tmux允许我们在ssh不稳定的情况下稳定得运行程序.  

# 简单的命令  
## session-level 
```
tmux ls                          # list sessions  
tmux new  -s SESSION_NAME        # 创建新的session  
tmux attach -t SESSION_NAME      # 连接session  
tmux detach                      # 从session断开  
tmux rename-session -t OLD_NAME NEW_NAME 
```
## window-level   

```
tmux new-window                   (prefix + c)          # prefix指的是Control+b同时按下后释放,prefix +c意味着Control+b同时按下后释放然后按c    
tmux select-window WINDOW_NAME    (prefix + WINDOW_NUM) # 切换窗口, window_number为1-9的数字   
tmux rename-window                (prefix + ,)          # 重命名窗口  
tmux kill-window -t WINDOW_NAME   (prefix + *)          # 关闭窗口  
```  
## pane-level   

```
tmux split-window       (prefix + ")           # 把当前window分成上下两个panes  
tmux split-window -h    (prefix + %)           # 把当前window分成左右两个panes  
tmux swap-pane -[UDLR]  (prefix + <arrow-key>) # navigate panes  
tmux kill-pane          (prefix + x)           # kill pane
```
