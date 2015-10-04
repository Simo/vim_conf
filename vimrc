execute pathogen#infect()
syntax on
filetype plugin indent on

syntax enable
if has('gui_running')
    colorscheme railscasts
    set background=dark
    ""colorscheme material-theme
    set guifont=Menlo:h13
else
    colorscheme vividchalk
endif

set synmaxcol=800           " don't try to highlight long lines

set number    " line numbers aren't needed

" Allow backgrounding buffers without writing them, and remember
" marks/undo
" " for backgrounded buffers
 set hidden
"
" " Auto-reload buffers when file changed on disk
 set autoread
"
" " Disable swap files; systems don't crash that often these days
 set updatecount=0
"
" " Make Vim able to edit crontab files again.
 set backupskip=/tmp/*,/private/tmp/*"
"
"" Whitespace
 set nowrap                        " don't wrap lines
 set tabstop=2                     " a tab is two spaces
 set shiftwidth=2                  " an autoindent (with <<) is two
" spaces
 set expandtab                     " use spaces, not tabs
 set list                          " Show invisible characters
 "" Searching
set hlsearch                      " highlight matches
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter
set gdefault                      " have :s///g flag by default on

 set notimeout

"" installazione di ctrlP per le ricerche in fuzzy logic
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
