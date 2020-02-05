
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

#ANACONDA
export PATH=$PATH:$HOME/anaconda3/bin
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/simonzimmermann/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/simonzimmermann/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/simonzimmermann/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/simonzimmermann/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

#PATHING
export CPLUS_INCLUDE_PATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib
export DEFAULT_USER="$(whoami)"

#ALIASES
alias python3="/usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/Python"
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
