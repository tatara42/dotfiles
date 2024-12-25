#
# ~/.bashrc
#

# Environment variable 
 export HYPRSHOT_DIR="~/Pictures"
 
# Bind

 eval "$(starship init bash)"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
PS1='\u/\W\$ '
