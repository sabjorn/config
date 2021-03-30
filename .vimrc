" VUNDLE PLUGINS
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'frazrepo/vim-rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'yinflying/matlab.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rdolgushin/groovy.vim'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'ThePrimeagen/vim-be-good'
call plug#end()

" BASIC
set nowrap
set breakindent
set number relativenumber
set numberwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

" LOOK
colorscheme onedark
let g:airline_theme='onedark'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
syntax on
let g:rainbow_active = 1

" ADVANCED
" git airline
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#branch#enabled = 1
" LaTeX
let g:vimtex_view_method = 'skim'
let g:tex_flavor = 'latex'
autocmd BufNewFile,BufRead *.tex   set syntax=tex
autocmd BufNewFile,BufRead *.cls   set syntax=tex
autocmd BufWritePost,FileWritePost *.tex :VimtexCompile
"nerdtree
map tree :NERDTreeToggle<CR>
"clipboard
set clipboard=unnamed
"vim be good
let g:vim_be_good_floating = 0

