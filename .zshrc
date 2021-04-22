# OH MY ZSH

# powerlevel
# enable powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZSH_THEME="powerlevel10k/powerlevel10k"

export ZSH=/Users/simonzimmermann/.oh-my-zsh
# plugins
plugins=(git osx zsh-autosuggestions zsh-syntax-highlighting docker)
source $ZSH/oh-my-zsh.sh

# vi mode
bindkey -v
export KEYTIMEOUT=1

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
