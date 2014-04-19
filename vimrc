" A lot of this is based on github.com/jdavis/dotfiles
set nocompatible

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
colorscheme wombat256


" Unhighlight (:nohlsearch) the last search pattern on Enter
nn <CR> :noh<CR><CR>

set autoindent

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

if bufwinnr(1)
    map + <C-W>>
    map - <C-W><
endif

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

Bundle 'mileszs/ack.vim'
Bundle 'othree/html5.vim' 
Bundle 'othree/javascript-libraries-syntax.vim' 
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'walm/jshint.vim'

" Syntastic syntax checker must go after Bundle 
Bundle 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['jshint']

Bundle 'Yggdroot/indentLine'

" Easymotion configuration
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'haya14busa/vim-easyoperator-line'
"Bundle 'haya14busa/vim-easyoperator-phrase'
map <Leader> <Plug>(easymotion-prefix)
map <Leader>h <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-linebackward)
map <Leader>q <Plug>(easymotion-bd-w)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" GoldenView
Bundle 'zhaocai/GoldenView.Vim'
let g:goldenview__enable_default_mapping = 0
" split to tiled windows
nmap <silent> <C-G>  <Plug>GoldenViewSplit
" quickly switch current window with the main pane and toggle back
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle
" jump to next and previous window
nmap <silent> <C-N>  <Plug>GoldenViewPrevious
nmap <silent> <C-M>  <Plug>GoldenViewNext

Bundle 'kien/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore=*/node_modules/*,*.so,*.swp,*.zip
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'

filetype plugin indent on

" --- Window buffer navigation shortcuts
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
