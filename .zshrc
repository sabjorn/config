# OH MY ZSH
# Path to your oh-my-zsh installation.
export ZSH=/Users/simonzimmermann/.oh-my-zsh
# powerline
POWERLEVEL9K_CUSTOM_OS_ICON='echo 🐉'
POWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND=black
POWERLEVEL9K_CUSTOM_OS_ICON_FOREGROUND=white
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_os_icon ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs time)
ZSH_THEME="powerlevel9k/powerlevel9k"
# plugins
plugins=(git osx jira zsh-autosuggestions zsh-syntax-highlighting)
# includes
source $ZSH/oh-my-zsh.sh

# BASIC
# defaults
export VISUAL=nvim
export EDITOR="$VISUAL"
export CPLUS_INCLUDE_PATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib
export DEFAULT_USER="$(whoami)"
# coloring
autoload -U colors && colors
export TERM="xterm-256color"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7f7f7f"

#ALIASES
alias vim="nvim"
alias git_rinse="git clean -xfd
                 git submodule foreach --recursive git clean -xfd
                 git reset --hard
                 git submodule foreach --recursive git reset --hard
                 git submodule update --init --recursive"
alias ls='exa' 
alias l='exa -lbF --git'
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'

#PATH
export PATH="~/.cargo/bin/:$PATH"
export PATH="/usr/local/sbin:$PATH"

#SERVICES
{fswatch -0 ~/Dropbox/HIDONASH/djMusic/uncompressed | xargs -0 -n 1 -I {} ~/dev/music_library_manager/convert_to_mp3.sh {} &} || true
{fswatch -0 ~/Dropbox/HIDONASH/djMusic/compressed | xargs -0 -n 1 -I {} ~/dev/music_library_manager/convert_to_aiff.sh {} &} || true

