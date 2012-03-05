"--------------------------------------------------------------------------------
"
" .vimrc
"
"--------------------------------------------------------------------------------

" Pathogen plugin to manage plugin in a single bundle directory
runtime bundle/pathogen/autoload/pathogen.vim

" Load plugins
call pathogen#infect()

set nocompatible " get out VI compatible mode
set hlsearch
set incsearch

" Tips to change the runtime path
" set runtimepath=/work/jealer01/tools/vimwiki/src,$VIMRUNTIME

syntax on
syntax enable

"--------------------------------------------------------------------------------
" General
"--------------------------------------------------------------------------------

set nocp
filetype indent on             " load filetype plugin/indent settings
filetype plugin on             " load filetype plugin/indent settings
set autochdir                  " always switch to current directory
set backspace=indent,eol,start " make backspace a bit more flexible
set clipboard+=unnamed         " share wimdows clipboard
set backup                     " make backup files
set mouse=a                    " use mouse everywhere
set noerrorbells               " don't make noise
set wildmenu                   " turn on cmd line completion wild style
set wildignore=*.o,*.obj,*.pyc
" set wildmode=list:longest

set cc=+1

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

if has('unix')
    " Unix-like platform (including Cygwin)
    set backupdir=/tmp " where to put backup files
    set directory=/tmp " where to put swap files
else
    " Windows platform
endif

" append line to keep windows synchronized and ignore whitespace differences
set diffopt=filler,iwhite

" Automatic configuration reload
autocmd BufWritePost ~/.vimrc source ~/.vimrc

" Spell checker
" set spell

"--------------------------------------------------------------------------------
" VIM UI
"--------------------------------------------------------------------------------

set cursorline
set incsearch
set laststatus=2 " always show the status line
set lazyredraw
set list
set listchars=tab:>-,trail:- " show tabs and trailing
set matchtime=5 " matching bracket blinking time
set shortmess=aOstT
set number " show line number
set numberwidth=4 " up to 9999
set ruler
set scrolloff=6
set showcmd " show the cmd being typed
set showmatch " show matching brackets
set statusline=%f%m%r[%L][%04l,%04v]
" set nostartofline " keep my cursor where it was

"--------------------------------------------------------------------------------
" Formatting
"--------------------------------------------------------------------------------

set expandtab
set ignorecase
set shiftround
set smartcase
set shiftwidth=4
set softtabstop=4
set tabstop=8
set nowrap

"--------------------------------------------------------------------------------
" Tags
"--------------------------------------------------------------------------------

nnoremap <F2> :TlistToggle<cr>

let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Use_Right_Window = 0
let Tlist_WinWidth = 50

" set tags+=. " /tmp

"--------------------------------------------------------------------------------
" VimWiki
"--------------------------------------------------------------------------------

let g:vimwiki_folding = 1
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_export': 1}]

"--------------------------------------------------------------------------------
" Completion
"--------------------------------------------------------------------------------

" map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" " automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" set completeopt=menuone,menu,longest,preview

" lets SuperTab decide which completion mode to use
let g:SuperTabDefaultCompletionType = "context"

"--------------------------------------------------------------------------------
" Syntax folding
"--------------------------------------------------------------------------------

"autocmd Syntax c,cpp,vim,xml,html,xhtml,verilog,python setlocal foldmethod=syntax
"autocmd Syntax python setlocal foldmethod=indent
"autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,verilog,python normal zR

au BufReadPost *.sv set syntax=verilog_systemverilog
au BufReadPost *.svh set syntax=verilog_systemverilog

" Foldind flip-flop function

let b:folded = 0
function! ToggleFold()
    if ( b:folded == 0 )
        exec "normal! zM"
        let b:folded = 1
    else
        exec "normal! zR"
        let b:folded = 0
    endif
endfunction

nmap <silent> <buffer> f za
nmap <silent> <buffer> F :call ToggleFold()<CR>

"--------------------------------------------------------------------------------
" GUI settings
"--------------------------------------------------------------------------------

map <silent><F12> :NEXTCOLOR<cr>
map <silent><F11> :PREVCOLOR<cr>

set t_Co=256

set guioptions=aiceh " simple dialog, GUI tabs
set guioptions-=m " remove menu
set guioptions-=T " remove toolbar

" Detect GVIM is running
" if has("gui_running")

" Detect Console VIM is running
" if has("gui_running")

if has("gui")
    set guifont=Monospace\ 9
"    if has("gui_gtk2")
"       set guifont=Monospace\ 9
"         " Linux GUI
"     elseif has("x11")
"         " X11 GUI (e.g. gtk1)
"     else
"         " Windows GUI
"    endif
endif

if has("gui_running")
    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>
    " colorscheme dante
    " colorscheme desert256
    " colorscheme desertEx
    " set background=light
    colorscheme solarized
    call togglebg#map("<F5>")
    set lines=80
    set columns=180
    set mousehide " hide mouse cursor when typing
    " set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
" else
    " colorscheme desert
    " set background=dark
endif

"--------------------------------------------------------------------------------
" Extension specific settings
"--------------------------------------------------------------------------------

" Python source code
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set softtabstop=4
au BufRead,BufNewFile *.py set tabstop=4

