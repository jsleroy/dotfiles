set nocompatible
filetype off

if !isdirectory($HOME . '/.vim/bundle/Vundle.vim')
  execute '!git clone https://github.com/VundleVim/Vundle.vim.git "' . \
  $HOME . '/.vim/bundle/vundle"'
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/xoria256.vim'
Plugin 'ervandew/supertab'
Plugin 'gmarik/hlmatch.vim'
Plugin 'vim-scripts/Mark--Karkat'
Plugin 'edkolev/promptline.vim'
Plugin 'itchyny/lightline.vim'
" Plugin 'bling/vim-airline'

call vundle#end()

filetype plugin indent on

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------

" Automatic configuration reload
autocmd BufWritePost ~/.vimrc source ~/.vimrc

" Check file changes
au CursorHold * checktime

" Remove existing autocmd
" autocmd!

syntax on
syntax enable

" Mouse always enabled
set mouse=a

" Turn on command line completion wild style
set wildmenu
" set wildmode=longest:full
" set wildmode=list:longest

set hlsearch
set incsearch

" Make backspace a bit more flexible
set backspace=indent,eol,start

" Don't make noise
set noerrorbells
set novisualbell
set ttyfast

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

"Highlight current line/column
set cursorline

set lazyredraw

" Show line number (up to 9999)
set number
set numberwidth=4

" Always show current position
set ruler

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
" set splitright

" Keep each line on its own line
set nowrap

" Turn backup and swap off
set nobackup
set noswapfile

" Simple dialog and gui tabs
set guioptions=aiceh

" Set number of history lines
set history=400

" The commandbar is 1 lines high
set cmdheight=1

" Set magic on
set magic

" Indent
set autoindent
set smartindent
set cindent
set formatoptions=tcroq

"disable switch/case and namespace indent
set cinoptions=l1,N-s

nmap <F1> <nop>

set completeopt=menuone,longest,preview
set pumheight=15
"imap <tab> <c-n>
"imap <Tab> <C-P>
let g:SuperTabDefaultCompletionType="context"

"-----------------------------------------------------------------------------
" Extension specific settings
"-----------------------------------------------------------------------------

au BufRead,BufNewFile *.bco   set filetype=json
au BufRead,BufNewFile *.proto set filetype=proto
au BufRead,BufNewFile *.v.m4  set filetype=verilog
au BufRead,BufNewFile *.v     set filetype=verilog
au BufRead,BufNewFile *.sv    set filetype=systemverilog

" Show doxygen syntax highligthing
let g:load_doxygen_syntax=1

au FileType python setl shiftwidth=4
au FileType python setl tabstop=4

au FileType verilog set textwidth=105

au FileType c,cpp setl foldmethod=syntax
au FileType c,cpp set textwidth=80

augroup commit
  autocmd FileType gitcommit,cvs setlocal spell textwidth=70 colorcolumn=71
augroup END
"-----------------------------------------------------------------------------
" Colorscheme settings
"-----------------------------------------------------------------------------

set t_Co=256
colorscheme xoria256

if has("gui")
  set mousehide " hide mouse cursor when typing
  set guioptions+=m  "show menu bar
  set guioptions-=T  "hide toolbar
  set guioptions-=r  "hide scrollbar
  set guifont=DejaVu\ Sans\ Mono\ 9
endif


"-----------------------------------------------------------------------------
" LightLine/Airline/Promptline settings
"-----------------------------------------------------------------------------

set laststatus=2

" let g:airline_left_sep=''
" let g:airline_right_sep=''

let g:promptline_powerline_symbols=0
let g:promptline_symbols = { 'dir_sep' : '/' }
let g:promptline_preset = {
        \'a': [ promptline#slices#host(), promptline#slices#user() ],
        \'b': [ promptline#slices#cwd() ],
        \'c' : [ promptline#slices#vcs_branch(), ],
        \'x' : [ promptline#slices#git_status(), ],
        \'z' : [ '$' ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

if !filereadable($HOME . '/dotfiles/promptline.sh')
  PromptlineSnapshot! ~/dotfiles/promptline.sh lightline
endif

"-----------------------------------------------------------------------------
" NetRW settings
"-----------------------------------------------------------------------------

let g:netrw_liststyle = 3
let g:mwDefaultHighlightingPalette = 'extended'
