# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=13     # set how often to auto-update (in days)

ZSH_THEME="robbyrussell"      # Set name of the theme to load. Optionally, could be set to "random"
# ENABLE_CORRECTION="true"    # enable command auto-correction
# COMPLETION_WAITING_DOTS="true" # display red dots whilst waiting for completion
HIST_STAMPS="yyyy-mm-dd"      # change the command execution timestamp shown in the history command output

autoload -U zmv

plugins=( )             # plugins to load

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source $ZSH/oh-my-zsh.sh