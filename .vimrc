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
call plug#end()

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
" turn on git branch display
let g:airline#extensions#branch#enabled = 1

" BASIC
set breakindent
" turn on line numbering
set number relativenumber
set numberwidth=4
" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" SYNTAX HIGHLIGHTING
colorscheme onedark
"Use 24-bit (true-color) mode for each vim version when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" turn on highlighting
syntax on

"turn on rainbow brackets
let g:rainbow_active = 1

" LATEX
let g:vimtex_view_method = 'skim'
let g:tex_flavor = 'latex'
autocmd BufNewFile,BufRead *.tex   set syntax=tex
autocmd BufNewFile,BufRead *.cls   set syntax=tex
autocmd BufWritePost,FileWritePost *.tex :VimtexCompile

" KEYMAP
map tree :NERDTreeToggle<CR>

" CLIPBOARD
set clipboard=unnamed

" vimbegood
let g:vim_be_good_floating = 0

