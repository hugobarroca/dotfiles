#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lsa='ls -la'

GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"

PS1="${BOLD}${GREEN}\A${RESET}> "
