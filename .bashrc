#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\033[38;5;6m\]\w>\[$(tput sgr0)\]"

alias ls='ls --color=auto'
alias jack="/home/velo/Software/nand2tetris/tools/JackCompiler.sh"