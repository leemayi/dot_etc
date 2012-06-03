# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export LC_ALL=C
export PATH=$PATH:~/tools:~/local/bin
alias vi='/home/huangjian/local/bin/vim'
alias vim='/home/huangjian/local/bin/vim'
alias vimdiff='/home/huangjian/local/bin/vimdiff'
export as=/home/huangjian/share/dev/as-trunk/app/ecom/nova/se/se-as
export ui=/home/huangjian/share/dev/as-trunk/app/ecom/nova/ui/
export bs=/home/huangjian/share/dev/bs-trunk/app/ecom/nova/se/se-bs
export ufs=/home/huangjian/share/dev/ufs_2_0/app/ecom/ufs
export dev=/home/huangjian/share/dev/
source /home/huangjian/etc_huangjian/bash_completion_tmux.sh
