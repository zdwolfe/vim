" A lot of this is based on github.com/jdavis/dotfiles
set nocompatible

" set leader to ,
let mapleader=","
let g:mapleader=","


function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

nmap <leader>p :set paste!<BAR>set paste?<CR>
vnoremap <leader>s :sort
nm <leader>t :tabnew<cr>

set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

set history=1000
set number
syntax on
set backspace=indent,eol,start
set ignorecase smartcase
set hlsearch
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set directory=$HOME/.vim/vimswap " swp and swo files are a pain in the ass to keep around in ./
set path=./*/**
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore=*/node_modules/*,*.so,*.swp,*.zip
colorscheme wombat256


" Unhighlight (:nohlsearch) the last search pattern on Enter
nn <CR> :noh<CR><CR>

set autoindent

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" --- Window buffer navigation shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

if bufwinnr(1)
    map + <C-W>>
    map - <C-W><
endif

" Fugitive mappings, taken from github.com/jdavis
nm <leader>gb :Gblame<cr>
nm <leader>gc :Gcommit<cr>
nm <leader>gd :Gdiff<cr>
nm <leader>gg :Ggrep
nm <leader>gl :Glog<cr>
nm <leader>gp :Git pull<cr>
nm <leader>gP :Git push<cr>
nm <leader>gs :Gstatus<cr>
nm <leader>gw :Gbrowse<cr>

" Taken from github.com/jdavis
" Original credit github.com/mikewadsten
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" setup for othree/html5.vim
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0


" Bundle stuff goes last
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'groenewege/vim-less'
" Bundle 'jimmyhchan/dustjs.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'othree/html5.vim' 
Bundle 'othree/javascript-libraries-syntax.vim' 
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'walm/jshint.vim'
Bundle 'zdwolfe/vim-gitwildignore' 

filetype plugin indent on
" Syntastic syntax checker must go after Bundle 
let g:syntastic_javascript_checkers = ['jshint']

