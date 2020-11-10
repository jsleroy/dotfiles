"-----------------------------------------------------------------------------
" Plugins.
"-----------------------------------------------------------------------------

let bootstrap = empty(glob('~/.vim/autoload/plug.vim'))

if bootstrap
  !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'vim-scripts/Mark--Karkat'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

if bootstrap
  PlugInstall
end

"-----------------------------------------------------------------------------
" Settings.
"-----------------------------------------------------------------------------

" Automatic configuration reload.
autocmd BufWritePost ~/.vimrc source ~/.vimrc

" vi improved
set nocompatible
syntax on
syntax enable

" Check file changes
au CursorHold * checktime

" Mouse always enabled
set mouse=a

" Highlight search
set hlsearch

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
" let g:load_doxygen_syntax=1

au BufRead,BufNewFile *.sb    set filetype=javascript
au BufRead,BufNewFile *.bcd   set filetype=javascript
au BufRead,BufNewFile *.proto set filetype=proto
au BufRead,BufNewFile *.v     set filetype=verilog

au FileType python setl shiftwidth=4
au FileType python setl tabstop=4

" let g:lightline = { 'colorscheme': 'solarized' }

if has("gui")
  set mousehide     " hide mouse cursor when typing
  set guioptions+=m " show menu bar
  set guioptions-=T " show toolbar
  set guioptions-=r " hide scrollbar
endif

if !has("gui_running")
  " set t_Co=256
else
endif
