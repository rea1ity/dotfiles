" Configuration

" Pathogen first

execute pathogen#infect()

" Basic Settings

filetype plugin indent on
syntax on
set shell=/bin/zsh
set guifont=Anonymous\ Pro\ Minus:h15
set nocompatible
set modelines=0
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set noundofile
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set wrap
set linebreak
set nolist
set formatoptions=qrn1
set spell spelllang=en_gb
set colorcolumn=80

" Aesthetics

colorscheme solarized
set background=dark

" Mappings and shortcuts

" Basics
let mapleader=","

" Miscellaneous

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
au FocusLost * :wa
vnoremap . :norm.<CR>

" Leader shortcuts


nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>n :set nonumber!<CR>
nnoremap <leader>rn :set norelativenumber!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>rc :so $MYVIMRC<CR>
nnoremap <leader>s :set spell!<CR>



" Control shortcuts

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
