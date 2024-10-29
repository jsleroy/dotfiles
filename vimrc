"-----------------------------------------------------------------------------
" Plugins
"-----------------------------------------------------------------------------

let directory = has("nvim") ? stdpath("data") . "/site" : "~/.vim"
let filename = directory . "/autoload/plug.vim"
let bootstrap = empty(glob(filename))

if bootstrap
  silent execute "!curl -fLo ".filename."/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/bats.vim'
Plug 'ervandew/supertab'
Plug 'vim-scripts/Mark--Karkat'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'itchyny/lightline.vim'
Plug 'kylelaker/riscv.vim'
Plug 'ziglang/zig.vim'
Plug 'dcharbon/vim-flatbuffers'
Plug 'editorconfig/editorconfig-vim'

if !has("nvim")
Plug 'tpope/vim-sensible'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
else
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
endif

call plug#end()

if bootstrap
  PlugInstall
end

"-----------------------------------------------------------------------------
" Settings
"-----------------------------------------------------------------------------

if !has("nvim")
  colorscheme catppuccin_mocha
else
  colorscheme catppuccin-mocha
endif

let g:lightline = { 'colorscheme': 'catppuccin_mocha' }

" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>

autocmd BufWritePost ~/.vimrc source ~/.vimrc " Automatic configuration reload.

let g:zig_fmt_autosave = 0  " Disable zig autoformat on save.

set termguicolors            "
set nocompatible             " Disable compatibility to vi
set ttyfast                  " Speed up scrolling in Vim
set clipboard=unnamedplus    " Using system clipboard
set showmatch                " Show matching brackets
set ignorecase               " Case insensitive
set mouse=v                  " middle-click paste with
set mouse=a                  " Mouse always enabled
set hlsearch                 " Highlight search
set incsearch                " Incremental search
set noerrorbells             " Don't make noise
set novisualbell             " Don't make noise
set encoding=utf-8           " Necessary to show Unicode glyphs
set guioptions=aiceh         " Simple dialog and gui tabs
set textwidth=80             " Set text width
set cc=+1                    " Color last column
set suffixes=.bak,~,.swp,.o  " Not in completion for filenames
set diffopt=filler           " Append line to keep windows synchronized and ignore whitespace differences
set list                     " Highlight special characters
set listchars=tab:>-,trail:- " Show tabs and trailing
set cursorline               " Highlight current line/column
set number                   " Show line numbers
set numberwidth=4            " (up to 9999)
set scrolloff=4              " Minimum number of lines to keep above and below the cursor
set tabstop=2                " Number of columns occupied by a tab
set softtabstop=2            " See multiple spaces as tabstops so <BS> does the right thing
set expandtab                " Converts tabs to white space
set shiftwidth=2             " Width for autoindents
set mat=2                    " How many tenths of a second to blink
set nowrap                   " Keep each line on its own line
set nobackup                 " Turn backup off
set noswapfile               " Turn swap off
set lbr
set splitbelow
set splitright
set cinoptions=N-s           " Disable namespace indentation

if !has("nvim")
  " set wildmode=longest,list    " Get bash-like tab completions
  set magic                    " Set magic on
  set cmdheight=1              " The commandbar is 1 lines high
  set completeopt=menuone,longest,preview
  set pumheight=15

  au CursorHold * checktime    " Check file changes
endif

syntax on
syntax enable
filetype plugin on

nmap <F1> <nop>

au BufRead,BufNewFile *.sb    set filetype=javascript
au BufRead,BufNewFile *.bcd   set filetype=javascript
au BufRead,BufNewFile *.proto set filetype=proto
au BufRead,BufNewFile *.v     set filetype=verilog

au FileType python setl shiftwidth=4
au FileType python setl tabstop=4

au BufRead,BufNewFile SConstruct set filetype=python
au BufRead,BufNewFile SConscript set filetype=python

if !has("nvim")
  if has("gui")
    set mousehide     " hide mouse cursor when typing
    set guioptions+=m " show menu bar
    set guioptions-=T " show toolbar
    set guioptions-=r " hide scrollbar
    set guifont="MesloLGS Nerd Font 10"
  endif
endif
