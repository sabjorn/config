" VUNDLE PLUGINS
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/fzf'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'lervag/vimtex'
Plugin 'scrooloose/nerdtree'
Plugin 'frazrepo/vim-rainbow'
Plugin 'airblade/vim-gitgutter'
Plugin 'yinflying/matlab.vim'
Plugin 'tidalcycles/vim-tidal'

call vundle#end()           
filetype plugin indent on    
" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
" turn on git branch display
let g:airline#extensions#branch#enabled = 1

" BASIC
set breakindent
" turn on line numbering
set number norelativenumber
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
