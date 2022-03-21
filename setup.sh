#!/usr/bin/env bash

set -e
set -o pipefail

# install neovim plugin manager 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install monokai theme
curl --create-dirs -O --output-dir  ~/.vim/colors/ https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim 

# install CoC, based on https://medium.com/@rohmanhakim/how-to-set-up-code-completion-for-vim-in-macos-9766dd459385
curl -sL install-node.now.sh | sh
npm install --global yarn
mkdir -p ~/.vim/pack/coc/start
cd ~/.vim/pack/coc/start
git clone https://github.com/neoclide/coc.nvim.git --depth=1
cd ~/.vim/pack/coc/start/coc.nvim
yarn install
