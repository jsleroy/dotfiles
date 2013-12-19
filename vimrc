"-----------------------------------------------------------------------------
"
" .vimrc
"
"-----------------------------------------------------------------------------

" Pathogen plugin to manage plugin in a single bundle directory
runtime bundle/pathogen/autoload/pathogen.vim

" Load plugins
filetype off
call pathogen#infect()
call pathogen#helptags()

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------

syntax on
syntax enable

filetype on
filetype indent on             " load filetype plugin/indent settings
filetype plugin on             " load filetype plugin/indent settings

set nocp
set nocompatible " get out VI compatible mode
set hlsearch
set incsearch
" set autochdir                  " always switch to current directory
set backspace=indent,eol,start " make backspace a bit more flexible
set clipboard+=unnamed         " share wimdows clipboard
set mouse=a                    " use mouse everywhere
set noerrorbells               " don't make noise
set wildmenu                   " turn on cmd line completion wild style
set wildignore=*.o,*.obj,*.pyc
" set wildmode=list:longest
set ttyfast
" Disable the stupid pydoc preview window for the omni completion
set completeopt-=preview
set cc=81

set encoding=utf-8 " Necessary to show Unicode glyphs

" Tips to change the runtime path
" set runtimepath=/work/jealer01/tools/vimwiki/src,$VIMRUNTIME

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" append line to keep windows synchronized and ignore whitespace differences
set diffopt=filler,iwhite

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
set expandtab
set ignorecase
set shiftround
set smartcase
set shiftwidth=4
set softtabstop=4
set tabstop=8
set nowrap
set t_Co=256
set guioptions=aiceh " simple dialog, GUI tabs
set guioptions-=m " remove menu
set guioptions-=T " remove toolbar
set nobackup
" set spell

" if has('unix')
"     " Unix-like platform (including Cygwin)
"     set directory=/tmp " where to put swap files
" else
"     " Windows platform
" endif

"-----------------------------------------------------------------------------
" Extension specific settings
"-----------------------------------------------------------------------------

" C/C++ source code
autocmd Syntax c,cpp set expandtab
autocmd Syntax c,cpp set shiftwidth=2
autocmd Syntax c,cpp set softtabstop=2
autocmd Syntax c,cpp set tabstop=2

" Python source code
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set softtabstop=4
au BufRead,BufNewFile *.py set tabstop=4

" SystemVerilog
au BufReadPost *.sv set syntax=verilog_systemverilog
au BufReadPost *.svh set syntax=verilog_systemverilog

" M4ified Verilog
au BufReadPost *.v.m4 set syntax=verilog_systemverilog

"-----------------------------------------------------------------------------
" Colorscheme settings
"-----------------------------------------------------------------------------

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

" GVIM settings
if has("gui_running")
    " Make shift-insert work like in Xterm
    " map <S-Insert> <MiddleMouse>
    " map! <S-Insert> <MiddleMouse>
    " colorscheme dante
    " colorscheme desert256
    " colorscheme desertEx
    " set lines=40
    " set columns=80
    set mousehide " hide mouse cursor when typing
    " set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
" else
    " colorscheme desert
    " set background=dark
endif

set background=dark
colorscheme solarized

" Transparent backgournd
"let g:solarized_termtrans=0

" For degraded mode
"let g:solarized_degrade=1

" let g:solarized_termcolors=256

" Increase contrast
"let g:solarized_contrast="high"

" ???
"let g:solarized_visibility="high"

" Switch between light/dark background
call togglebg#map("<F5>")

"-----------------------------------------------------------------------------
" Syntax folding
"-----------------------------------------------------------------------------

autocmd Syntax c,cpp,vim,xml,html,xhtml,verilog,python setlocal fdm=syntax
" autocmd Syntax python setlocal foldmethod=indent
" autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,verilog,python normal zR

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


"-----------------------------------------------------------------------------
" Misc
"-----------------------------------------------------------------------------

" Automatic configuration reload
autocmd BufWritePost ~/.vimrc source ~/.vimrc


"-----------------------------------------------------------------------------
" Tagbar settings
"-----------------------------------------------------------------------------

let g:tagbar_usearrows = 1
let g:tagbar_left = 1
nnoremap <F2> :TagbarToggle<cr>
"nnoremap <leader>l :TagbarToggle<cr>


"-----------------------------------------------------------------------------
" VimWiki settings
"-----------------------------------------------------------------------------

let g:vimwiki_folding = 1
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_export': 1}]


"-----------------------------------------------------------------------------
" OmniCompletion settings
"-----------------------------------------------------------------------------

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


"-----------------------------------------------------------------------------
" Supertab settings
"-----------------------------------------------------------------------------

" lets SuperTab decide which completion mode to use
let g:SuperTabDefaultCompletionType = "context"


"-----------------------------------------------------------------------------
" Powerline settings
"-----------------------------------------------------------------------------

" let g:Powerline_symbols = 'unicode'
" let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'compatible'
" let g:Powerline_colorscheme = 'solarized'
" let g:Powerline_theme = 'solarized256'


"-----------------------------------------------------------------------------
" NetRW settings
"-----------------------------------------------------------------------------

let g:netrw_liststyle = 3

"-----------------------------------------------------------------------------
" Color plugin settings
"-----------------------------------------------------------------------------

map <silent><F12> :NEXTCOLOR<cr>
map <silent><F11> :PREVCOLOR<cr>


