"-----------------------------------------------------------------------------
" Plugins
"-----------------------------------------------------------------------------

let bootstrap = empty(glob('~/.vim/autoload/plug.vim'))

if bootstrap
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'vim-scripts/Mark--Karkat'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/gprof.vim'
Plug 'vim-scripts/Align', { 'on': 'Align' }
Plug 'vim-scripts/Mixed-sourceassembly-syntax-objdump'
Plug 'vim-scripts/xoria256.vim'

call plug#end()

if bootstrap
  PlugInstall
end

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------

" vi improved
set nocompatible

" Automatic configuration reload
autocmd BufWritePost ~/.vimrc source ~/.vimrc

syntax on

" Check file changes
au CursorHold * checktime

" Mouse always enabled
set mouse=a

" Highlight search
set hlsearch

"-----------------------------------------------------------------------------
" Settings defined in vim-sensible
"-----------------------------------------------------------------------------

"filetype plugin indent on
"syntax enable
"
" Make backspace a bit more flexible
" set backspace=indent,eol,start
"
" Turn on command line completion wild style
" set wildmenu
" set wildmode=longest:full
" set wildmode=list:longest
"
" set incsearch
"
" set laststatus=2
"
" Always show current position
" set ruler
"
" Set number of history lines
" set history=400
"
" set autoindent
"-----------------------------------------------------------------------------

" Don't make noise
set noerrorbells
set novisualbell

" Set text width and color last column
set textwidth=80
set cc=+1

" Necessary to show Unicode glyphs
set encoding=utf-8

" Suffixes that get lower priority when doing tab completion for filenames
set suffixes=.bak,~,.swp,.o

" Append line to keep windows synchronized and ignore whitespace differences
set diffopt=filler

" Highlight special characters
set list
set listchars=tab:>-,trail:- " show tabs and trailing

" Highlight current line/column
set cursorline

" Show line number (up to 9999)
set number
set numberwidth=4

" Minimum number of lines to keep above and below the cursor
set scrolloff=4

" Show matching brackets
set showmatch

" How many tenths of a second to blink
set mat=2

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set lbr

set splitbelow
set splitright

" Keep each line on its own line
set nowrap

" Turn backup and swap off
set nobackup
set noswapfile

" Simple dialog and gui tabs
set guioptions=aiceh

" The commandbar is 1 lines high
set cmdheight=1

" Set magic on
set magic

" Disable namespace indentation
set cinoptions=N-s

" Disable F1 key - conflict with 'help' terminal shortcut
nmap <F1> <nop>

set completeopt=menuone,longest,preview
set pumheight=15

" Show doxygen syntax highligthing
let g:load_doxygen_syntax=1

"-----------------------------------------------------------------------------
" Extension specific settings
"-----------------------------------------------------------------------------

au BufRead,BufNewFile *.sb    set filetype=javascript
au BufRead,BufNewFile *.bco   set filetype=javascript
au BufRead,BufNewFile *.proto set filetype=proto
au BufRead,BufNewFile *.v.m4  set filetype=verilog
au BufRead,BufNewFile *.v     set filetype=verilog
au BufRead,BufNewFile *.sv    set filetype=verilog

au FileType python setl shiftwidth=4
au FileType python setl tabstop=4

augroup commit
  autocmd FileType gitcommit,cvs setlocal spell textwidth=70 colorcolumn=71
augroup END

"-----------------------------------------------------------------------------
" Colorscheme settings
"-----------------------------------------------------------------------------

set t_Co=256
colorscheme xoria256

if has("gui")
  set mousehide     " hide mouse cursor when typing
  set guioptions+=m " show menu bar
  set guioptions-=T " show toolbar
  set guioptions-=r " hide scrollbar
  set guifont=DejaVu\ Sans\ Mono\ 9
endif

nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
