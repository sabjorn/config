
# Path to your oh-my-zsh installation.
export ZSH=/Users/simonzimmermann/.oh-my-zsh

#POWERLINE
POWERLEVEL9K_CUSTOM_OS_ICON='echo 👽'
POWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND=black
POWERLEVEL9K_CUSTOM_OS_ICON_FOREGROUND=white
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_os_icon ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs time)
ZSH_THEME="powerlevel9k/powerlevel9k"

# set plugins
plugins=(zsh-aliases-exa git osx jira zsh-autosuggestions zsh-syntax-highlighting)

# enable colors
autoload -U colors && colors
export TERM="xterm-256color"

export CPLUS_INCLUDE_PATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib
export DEFAULT_USER="$(whoami)"

#ALIASES
alias todo="todoist --color list --filter 'overdue | today'"
alias c="clear"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias tidalup="~/Google\ Drive/SIGMOID/workflow/tidal/launch_tidal.sh"

#DEFAULTS
export VISUAL=vim
export EDITOR="$VISUAL"

#INCLUDES
source "/Users/simonzimmermann/dev_tools/todoist/todoist_functions_fzf.sh"
source $ZSH/oh-my-zsh.sh

#PATH
export PATH="$HOME/dev/normalizer/:$PATH"

neofetch --stdout
export PATH="/usr/local/sbin:$PATH"
