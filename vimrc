"-----------------------------------------------------------------------------
"
" .vimrc
"
"-----------------------------------------------------------------------------

" Get out VI compatible mode
set nocompatible

" Pathogen plugin manager
runtime bundle/pathogen/autoload/pathogen.vim

" Load plugins
call pathogen#infect()
call pathogen#helptags()

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------

" Remove existing autocmd
autocmd!

syntax on
syntax enable

" Enable filetype plugin
filetype on
filetype indent on
filetype plugin on

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
set diffopt=filler,iwhite

" Highlight special characters
set list
set listchars=tab:>-,trail:- " show tabs and trailing

"Highlight current line/column
set cursorline
" if has("gui_running")
"   set cursorline
"   hi cursorline guibg=Grey10
"   hi CursorColumn guibg=Grey10
"endif

" Always show the status line
set laststatus=2

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

" Keep each line on its own line
set nowrap

" Turn backup off
set nobackup

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

" set spell
" set showcmd
" set statusline=%f%m%r[%L][%04l,%04v]

" Check file changes
:au CursorHold * checktime

" Automatic configuration reload
autocmd BufWritePost ~/.vimrc source ~/.vimrc

:nmap <F1> <nop>

"-----------------------------------------------------------------------------
" Extension specific settings
"-----------------------------------------------------------------------------

au BufRead,BufNewFile *.proto set filetype=proto
au BufRead,BufNewFile *.v.m4  set filetype=verilog
au BufRead,BufNewFile *.v     set filetype=verilog
au BufRead,BufNewFile *.sv    set filetype=systemverilog

" Show doxygen syntax highligthing
let g:load_doxygen_syntax=1

"-----------------------------------------------------------------------------
" Colorscheme settings
"-----------------------------------------------------------------------------

" set background=dark
set t_Co=256
" colorscheme xoria256
" colorscheme darkmate

if has("gui")
  set guifont=Monospace\ 9
endif

" GVIM settings
if has("gui_running")
    " Hide mouse cursor when typing
    set mousehide
endif


"-----------------------------------------------------------------------------
" Tagbar settings
"-----------------------------------------------------------------------------

let g:tagbar_usearrows = 1
let g:tagbar_left = 1
nnoremap <F2> :TagbarToggle<cr>


"-----------------------------------------------------------------------------
" Supertab settings
"-----------------------------------------------------------------------------

" lets SuperTab decide which completion mode to use
let g:SuperTabDefaultCompletionType = "context"


"-----------------------------------------------------------------------------
" Airline settings
"-----------------------------------------------------------------------------


"-----------------------------------------------------------------------------
" NetRW settings
"-----------------------------------------------------------------------------

let g:netrw_liststyle = 3

let g:mwDefaultHighlightingPalette = 'extended'
