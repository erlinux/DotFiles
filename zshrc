export ZSH=$HOME/.oh-my-zsh
export XMODIFIERS=@im=ibus
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
#-------------------------------------------------------------------
# Path to your oh-my-zsh configuration.设置 ZSH默认路径
ZSH=$HOME.oh-my-zsh

# Setup terminal, and turn on colors 颜色配置
#export TERM=xterm-256color
##export CLICOLOR=1
#export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
#export GREP_OPTIONS='--color=auto'
#export GREP_COLOR='3;33'

# 设置默认编辑器
alias vi='vim'
alias edit=$EDITOR
export EDITOR="vim"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
alias szsh='source $HOME/.zshrc'

#ZSH_THEME="ys"

# -------------------------------------------------------------------
# Directory movement 文件夹移动
# -------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# -------------------------------------------------------------------
# Directory information 文件信息
# -------------------------------------------------------------------
alias ll="ls -l --color=auto"
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

#


 ###

 # -------------------------------------------------------------------
 # 服务器 Servers
 # -------------------------------------------------------------------
	alias aliyun='ssh -i ~/.ssh/server.ittulab.com root@server.ittulab.com'
	alias hk='ssh -i ~/.ssh/hk.iterlinux.com root@hk.iterlinux.com'
 # -------------------------------------------------------------------
 # VPS 相关 Servers in air
 # -------------------------------------------------------------------

 # -------------------------------------------------------------------
 # 快速编辑常用文件 Quick Edit
 # -------------------------------------------------------------------

 ###快速编辑
# ze(){
#	 vim ~/.zshrc  #编辑ZSH配置文件
# }
# hosts(){
#	 sudo vim /etc/hosts  #编辑 hosts 文件
# }
#	 vim ~/.vimrc #编辑vim配置
# }

ip(){
   curl ip.cn/$1 #调用ip.cn接口查询ip
}




 #alias pc="proxychains4"
 # -------------------------------------------------------------------
 # Git
 # -------------------------------------------------------------------
 #alias gam="git commit -a -m"
 #alias gc= "git checkout"
 #alias gs="git status"
 #alias gp='git push'
 #alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit "
 #alias gb='git branch'
 #alias gd='git diff' #显示缓存变化
 #alias ghard='git reset --hard'
 # -------------------------------------------------------------------
 # SVN 配置
 # -------------------------------------------------------------------

 #给svn 添加颜色区分
 function svn {
 command svn "$@" | awk '
 BEGIN {
 cpt_c=0;
  }
  {
	  if        ($1=="C") {
		  cpt_c=cpt_c+1;
		  print "\033[31m" $0 "\033[00m";  # Conflicts are displayed in red
	  }
  else if   ($1=="A") {
	  print "\033[32m" $0 "\033[00m";  # Add in green
  }
	else if   ($1=="?") {
		print "\033[36m" $0 "\033[00m";  # New in cyan
	}
else if   ($1=="D") {
	print "\033[35m" $0 "\033[00m";  # Delete in magenta
}
	else                {
		print $0;                        # No color, just print the line
	}
}
END {
print cpt_c, " conflicts are found.";
  }';
}
#

# -------------------------------------------------------------------
# 极点客  Geek
# -------------------------------------------------------------------
# 利用 python 内置快速建立个简单的服务器
#function hittp {
#myip
#echo '你的服务器地址是:' $lanip
#python -m SimpleHTTPServer $1
#}
#function nodeweb {
#echo '启动Node Http Server'
# http-server
#}

###快速查看IP地址
#function ipfor(){
#dig +short $1 | grep -E '^[0-9.]+$' | head -1
#}

###快速开启apache

function hiapache {
sudo systemctl start httpd
}


###快速查看本机IP地址
function myip(){
myip="$(ifconfig | grep 'inet.*netmask.*broadcast')"
lanip="$(echo $myip | awk '{print $2}')"
publicip="$(echo $myip | awk '{print $6}')"
echo '你的局域网IP是: '$lanip
echo '你的外网IP是: '$publicip
echo '已经复制到剪贴板' pbcopy
}

# -------------------------------------------------------------------
# 系统相关 Mac Only
# -------------------------------------------------------------------
#null
#null	by:rabbit
# -------------------------------------------------------------------
# Android
# -------------------------------------------------------------------
#alias adblb="adb forward tcp:9222 localabstract:liebao_devtools_remote"

# -------------------------------------------------------------------
# 开发相关
# -------------------------------------------------------------------

alias gt="grunt"
alias gwb="grunt watch:base"
alias gbl="grunt bundle"
alias gpb="grunt publish"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# 选择你所需要的插件

#plugins=(git node brew svn)
#plugins=(autojump)
#source $ZSH/oh-my-zsh.sh
#source ~/.nvm/nvm.sh
#Npm相关
alias cnpm="npm --registry=http://r.cnpmjs.org \
	--cache=$HOME/.npm/.cache/cnpm \
	--disturl=http://dist.cnpmjs.org \
	--userconfig=$HOME/.cnpmrc"
# For luolei

#Chinese Support 中文支持
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#Android DEV 安卓Adb工具对应位置
###
fucntion mkd(){
mkdir -p "$@" && cd "$@"
   }
   ###列出系统最大的文件 快捷 maxfile 即可
 #  maxfile(){
#	   lsof / | awk '{ if($7 > 1048576) print $7/1048576 "MB "$9 }' | sort -n -u | tail
#   }

#   extract () {
#	   if [ -f $1 ] ; then
#		   case $1 in
#			   *.tar.bz2)   tar xjf $1     ;;
#		   *.tar.gz)    tar xzf $1     ;;
#	   *.bz2)       bunzip2 $1     ;;
 #  *.rar)       unrar e $1     ;;
#		*.gz)        gunzip $1      ;;
#	*.tar)       tar xf $1      ;;
#*.tbz2)      tar xjf $1     ;;
#		*.tgz)       tar xzf $1     ;;
#	*.zip)       unzip $1       ;;
#*.Z)         uncompress $1  ;;
#		*.7z)        7z x $1        ;;
#	*)     echo "'$1' cannot be extracted via extract()" ;;
#esac
#	 else
#		 echo "'$1' is not a valid file"
#	 fi
# }
