# ~/.bashrc

 eval "$(starship init bash)"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set up fzf key bindings and fuzzy completion
FZF_CTRL_T_COMMAND= 
FZF_ALT_C_COMMAND= 
eval "$(fzf --bash)"



# Bind
script="$(realpath ~/.local)/scripts/"

bind '"\C-n":"${script}fznvim.sh\n"'
bind '"\C-t":"${script}fztmux.sh\n"'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'

# Dir Aliases
PS1='\u/\W\$ '

alias sddmconfig='sudo vim /usr/lib/sddm/sddm.conf.d/default.conf'
alias loginthemes="cd /usr/share/sddm/themes/"
alias cls="clear -x"
alias cpc="wl-copy <"
alias pw="wl-copy < ~/.pw"

