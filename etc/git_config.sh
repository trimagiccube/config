##################################################
#你可以通过以下命令查看所有的配置以及它们所在的文件
#git config --list --show-origin
##################################################

##################################################
# 配置name 和 mail
git config --global user.name "xiaowen.yan"
git config --global user.email xiaowen.yan@iluvatar.ai
##################################################

##################################################
# 配置git编辑器
git config --global core.editor vim
##################################################

##################################################
# 解决冲突时候 git mergetool自动调用
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
##################################################

##################################################
# git difftool时使用
git config --global diff.tool vimdiff
git config --global difftool.prompt false
##################################################

##################################################
# git commit 时调用的模板
git config --global commit.template ~/.git-commit-template.txt
##################################################

##################################################
# git 别名
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
##################################################
