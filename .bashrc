# ~/.bashrc
# REMOVE GPT_KEY BEFORE COMMIT

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@h \W]$ '
export PATH=${PATH}:$HOME/applications:$HOME/scripts:$HOME/.local/bin
export EDITOR='helix'
export VISUAL='helix'
export GPT_KEY=''
export SCREEN_SCALE='1.6'
alias hl='Hyprland'
alias sx='startx'
alias ls='ls --color=auto'
alias ra='ranger'
alias hx='helix'
nitch
