"don't use Vi compatible mode
set nocompatible

"enable syntax highlighting
syntax enable

"enable auto indent and use specific indentation for filetypes
filetype plugin indent on
set autoindent

"don't close buffer if you close window, only hide it
set hidden

"set encoding
set encoding=utf-8

"set history length
set history=1000

"set offset for scrolling
set scrolloff=7

"enable wildmenu (suggestions for tab)
set wildmenu

"enable numbering
set number

"set tab width
set tabstop=4
set shiftwidth=4
set expandtab

"set whitespace character rendering
set list
set listchars=eol:¬,tab:▸-,trail:·,space:·
highlight Specialkey ctermfg=DarkGray guifg=DarkGray
"highlight SpecialKey guifg=#555555

"?????????????????????????????????????????????????????????????????????????????????????????????????
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"search highlighting
"set hlsearch
set incsearch

"activate foldcolumn on the left
set foldcolumn=1

"activate undofile and set levels of undo
set undofile
set undodir=$HOME/vimundo
set undolevels=1000

"save with <C-s>
map <C-s> :w<cr>
imap <C-s> <esc><cr>a
vmap <C-s> <esp>:w<cr>

"copy whole file with <C-a>
map <C-a> :%y+<cr>:%y<cr>

"change active window with <C-h,j,k,l>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"colorscheme and font
"colorscheme desert
set guifont=Monospace\ 10

"PLUGINS"
call plug#begin()

"Project view
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"vim theme
Plug 'rakr/vim-one'

"view and move in undo-tree
"Plug 'sjl/gundo.vim'

"statusbar
Plug 'vim-airline/vim-airline'

"fuzzy search for files
Plug 'kien/ctrlp.vim'

"autocompletion
Plug 'Valloric/YouCompleteMe'

"snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

let g:airline_theme='one'
colorscheme one
set background=dark " for the dark version
" set background=light " for the light version

"toggle NERDTree with ctrl+n
map <C-n> :NERDTreeToggle<cr>
"close vim, even if NERDTree is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"open NERDTree if you start vim without a file as argument or with directory
"as argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | wincmd p | ene | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"Python Version for YouCompleteMe
let g:ycm_server_python_interpreter='/usr/bin/python3'
"YouCompleteMe kyemappings
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_list_stop_completion = ['<C-y>']

"Ultisnips keymappings
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
"Ultisnips directories
let g:UltiSnipsSnippetDirectories=["UltiSnips", "own_snippets"]
