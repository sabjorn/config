" requirements:
" nvim nightly, neovim python module, clang dyllib (llvm project), ripgrep

" VUNDLE PLUGINS
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" general
Plug 'VundleVim/Vundle.vim'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'dense-analysis/ale'

" looks
Plug 'frazrepo/vim-rainbow'
Plug 'yinflying/matlab.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'rdolgushin/groovy.vim'
Plug 'kyazdani42/nvim-web-devicons'

" autocompletion
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'zchee/deoplete-clang'

"Telescope
Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" misc
Plug 'ThePrimeagen/vim-be-good'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
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
let mapleader=" "


" LOOK
colorscheme onedark
let g:airline_theme='onedark'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
syntax on
let g:rainbow_active = 1
set encoding=utf8


" ADVANCED
" autocompletion
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/Users/simonzimmermann/dev_tools/llvm-project/build/lib/libclang.dylib'
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteTags

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" git airline
let g:airline#extensions#branch#enabled = 1

" LaTeX
let g:vimtex_view_method = 'skim'
let g:tex_flavor = 'latex'
autocmd BufNewFile,BufRead *.tex   set syntax=tex
autocmd BufNewFile,BufRead *.cls   set syntax=tex
autocmd BufWritePost,FileWritePost *.tex :VimtexCompile

"nerdtree
map <leader>t :NERDTreeToggle<CR>

"clipboard
set clipboard=unnamed

"vim be good
let g:vim_be_good_floating = 0

