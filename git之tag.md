# 作用  
gitlab/github的tag用来静态得标记版本.比如在branch v0.1开发时,到了某次commit时(比如当前可以作为上线的版本),为了标记当前状态,设置tag v0.1.1.  

# 使用方法  
## 打标签  
git tag -a 0.1.1 -m "Release version 0.1.1"  

## 提交到远程服务器  
git push origin --tag  # 全部tags  
git push origin v0.1.1 # 单个tag

## 从远程fetch所有tag  
git fetch --tags  

## reset to某个tag
git checkout -b [newBranch] v0.1.1 # 需要创建新分支,因为tag只是一个快照

## 删除远程tag
git push origin :refs/tags/v0.1.1  

## 删除本地tag  
git tag -d v0.1.1  

## 查看本地所有tags  
git tag  

## 查看某个tag  
git show v0.1.1  

## 给指定的commit打tag  
git tag v0.1.1 5ad71e11
