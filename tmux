tmux被称为terminal complexer,作用就是在一个窗口下可以打开多个窗口和切分窗口(叫做panes).层次为3级:session,window和pane.当我们exit后就删除了所在的
session,window或pane

session-level :  
  >tmux ls # list sessions  
  >tmux new  -s {session_name}
  >tmux attach -t {session_name}  
  >tmux detach  
  >tmux rename-session -t {old_name} {new_name}  

window-level :  
  >tmux new-window (prefix + c) # prefix指的是Control+b同时按下后释放,prefix +c意味着Control+b同时按下后释放然后按c    
  >tmux select-window {window_name}  (prefix + {window_number}) # 切换窗口   
  >tmux rename-window (prefix + ,) # 重命名窗口  
  > prefix + & # 关闭窗口  
  
pane-level:  
  >tmux split-window  (prefix + ") # 把当前window分成上下两个panes  
  >tmux split-window -h (prefix + %) # 把当前window分成左右两个panes  
  >tmux swap-pane -[UDLR]  (prefix + <arrow-key>) # navigate panes  
