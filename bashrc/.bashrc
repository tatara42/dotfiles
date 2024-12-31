#
# ~/.bashrc
# 
#
# Bind

 eval "$(starship init bash)"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'


# Dir Aliases
alias work="cd ~/Documents/Projects"
alias download="cd ~/Downloads"
alias document="cd ~/Documents"
PS1='\u/\W\$ '

alias sddmconfig='sudo vim /usr/lib/sddm/sddm.conf.d/default.conf'
alias loginthemes="cd /usr/share/sddm/themes/"
