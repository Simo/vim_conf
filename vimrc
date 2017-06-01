execute pathogen#infect()
syntax on
filetype plugin indent on

syntax enable
if has('gui_running')
    colorscheme railscasts
    set background=dark
    ""colorscheme material-theme
    set guifont=Menlo:h16
else
  colorscheme seti
    "" colorscheme vibrantink
    ""colorscheme vividchalk
    "" colorscheme grb256
    "" colorscheme railscasts
    ""set background=light
    ""colorscheme solarized
endif

"" define the leader
let mapleader=","

"" who needs arrows?
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" set clipboard to unnamed
set clipboard=unnamed

"" set character encoding
set encoding=utf-8

"" cursor highlight
set cursorline   " highlight current line
set cursorcolumn " highlight current column

" set the cursor to a vertical line in insert mode and a solid block
" in command mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

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
"set nowrap                        " don't wrap lines

"" setting wrap
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two
" spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
 "" Searching
set hlsearch                      " highlight matches
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter
set incsearch
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"" fix vim broken regex
nnoremap / /\v
vnoremap / /\v
set gdefault                      " have :s///g flag by default on


set notimeout

"" autosave on focus out
au FocusLost * :wa


cnoremap %% <C-R>=expand('%:h').'/'<cr>

"" get back to previous buffer
nnoremap <leader><leader> <c-^>

"" quick colon
nnoremap ; :

"" quick exit insert mode
inoremap jj <ESC>

"" create an empty split window and move to it
nnoremap <leader>w <C-w>v<C-w>l

"" open .vimrc file in a new split window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" per far girare automaticamente la classe di test con rspec
nnoremap <leader>t :w\|!rspec %:p<cr>

"" navigation between buffers
nnoremap <leader><leader> <c-^>

"" rapidly gets Ack
nnoremap <leader>a :Ack

"" installazione di ctrlP per le ricerche in fuzzy logic
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>. :CtrlPTag<cr>


" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

"" NERDTree
map <C-n> :NERDTreeToggle<CR>

"" syntactic configuration
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost *.rb,*.erb call UpdateTags()
