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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'frazrepo/vim-rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'yinflying/matlab.vim'
Plug 'tidalcycles/vim-tidal'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
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

" TIDAL CYCLES
if (has("autocmd")) && (expand("%:e")=="tidal")
    augroup colorextend
        autocmd!
        let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
        autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 160 } })
        autocmd ColorScheme * call onedark#extend_highlight("Number", { "fg": { "cterm": 255 } })
        autocmd ColorScheme * call onedark#extend_highlight("Float", { "fg": { "cterm": 255 } })
        autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "fg": { "cterm": 160 } })
        autocmd ColorScheme * call onedark#extend_highlight("String", { "fg": { "cterm": 160 } })
        autocmd ColorScheme * call onedark#extend_highlight("Operator", { "fg": { "cterm": 255 } })
    augroup END
endif
colorscheme onedark

" tidal cycles mappings
let g:tidal_no_mappings = 1
if !hasmapto('<Plug>TidalLineSend', 'n')
  nmap <buffer> <localleader>s  <Plug>TidalLineSend
endif

if !hasmapto('<Plug>TidalParagraphSend', 'n')
  nmap <buffer> <localleader>ss <Plug>TidalParagraphSend
  nmap <buffer> <c-e> <Plug>TidalParagraphSend
endif

imap <buffer> <c-e> <Esc><Plug>TidalParagraphSend<Esc>i<Right>

nnoremap <buffer> <localleader>h :TidalHush<cr>
nnoremap <buffer> <c-h> :TidalHush<cr>

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
