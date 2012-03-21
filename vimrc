"-----------------------------------------------------------------------------
"
" .vimrc
"
"-----------------------------------------------------------------------------

" Pathogen plugin to manage plugin in a single bundle directory
runtime bundle/pathogen/autoload/pathogen.vim

" Load plugins
call pathogen#infect()


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
set autochdir                  " always switch to current directory
set backspace=indent,eol,start " make backspace a bit more flexible
set clipboard+=unnamed         " share wimdows clipboard
set backup                     " make backup files
set mouse=a                    " use mouse everywhere
set noerrorbells               " don't make noise
set wildmenu                   " turn on cmd line completion wild style
set wildignore=*.o,*.obj,*.pyc
" set wildmode=list:longest
set ttyfast
" Disable the stupid pydoc preview window for the omni completion
set completeopt-=preview
set cc=+1

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
" set spell

if has('unix')
    " Unix-like platform (including Cygwin)
    set backupdir=/tmp " where to put backup files
    set directory=/tmp " where to put swap files
else
    " Windows platform
endif

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
    " map <S-Insert> <MiddleMouse>
    " map! <S-Insert> <MiddleMouse>
    " colorscheme dante
    " colorscheme desert256
    " colorscheme desertEx
    " set background=light
    set lines=40
    set columns=80
    set mousehide " hide mouse cursor when typing
    " set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
" else
    " colorscheme desert
    " set background=dark
endif


"-----------------------------------------------------------------------------
" Extension specific settings
"-----------------------------------------------------------------------------

" Python source code
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set softtabstop=4
au BufRead,BufNewFile *.py set tabstop=4

" SystemVerilog
au BufReadPost *.sv set syntax=verilog_systemverilog
au BufReadPost *.svh set syntax=verilog_systemverilog


"-----------------------------------------------------------------------------
" Colorscheme settings
"-----------------------------------------------------------------------------

" Transparent backgournd
"let g:solarized_termtrans=0

" For degraded mode
"let g:solarized_degrade=1

"let g:solarized_termcolors=256

" Increase contrast
"let g:solarized_contrast="high"

" ???
"let g:solarized_visibility="high"

" Switch between light/dark background
call togglebg#map("<F5>")

colorscheme solarized


"-----------------------------------------------------------------------------
" Syntax folding
"-----------------------------------------------------------------------------

"autocmd Syntax c,cpp,vim,xml,html,xhtml,verilog,python setlocal foldmethod=syntax
"autocmd Syntax python setlocal foldmethod=indent
"autocmd Syntax c,cpp,vim,xml,html,xhtml,perl,verilog,python normal zR

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
" Python mode settings
"-----------------------------------------------------------------------------

" Choices are pep8 / pylint / mccabe
let g:pymode_lint_checker = "pyflakes"

" Disable pylint checking every save
let g:pymode_lint_write = 1

" Run linter on the fly
let g:pymode_lint_onfly = 1

" Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 1

" Show error message if cursor placed at the error line
let g:pymode_lint_message = 1

" Hold cursor in current window
" when quickfix is open
let g:pymode_lint_hold = 1

" Enable pymode's custom syntax highlighting
"let g:pymode_syntax = 1

" Enable all python highlightings
"let g:pymode_syntax_all = 1

" Highlight "print" as function
"let g:pymode_syntax_print_as_function = 1

" Highlight indentation errors
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Highlight trailing spaces
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Highlight string formatting
"let g:pymode_syntax_string_formatting = g:pymode_syntax_all

" Highlight str.format syntax
"let g:pymode_syntax_string_format = g:pymode_syntax_all

" Highlight string.Template syntax
"let g:pymode_syntax_string_templates = g:pymode_syntax_all

" Highlight doc-tests
"let g:pymode_syntax_doctests = g:pymode_syntax_all

" Highlight builtin objects (__doc__, self, etc)
"let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

" Highlight builtin functions
"let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

" Highlight exceptions
"let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

" For fast machines
"let g:pymode_syntax_slow_sync = 0
"
" Enable python folding
let g:pymode_folding = 1

" Enable python objects and motion
let g:pymode_motion = 1

"-----------------------------------------------------------------------------
" Color plugin settings
"-----------------------------------------------------------------------------

map <silent><F12> :NEXTCOLOR<cr>
map <silent><F11> :PREVCOLOR<cr>


