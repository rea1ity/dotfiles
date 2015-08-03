" startup {{{
execute pathogen#infect()

let s:running_windows = has("win16") || has("win32") || has("win64")
" }}}

" basics {{{
filetype plugin indent on                 " determine filetype based on name and possibly contents
syntax on                                 " enable syntax processing
set backup                                " make backup files
set encoding=utf-8
set fileformats=unix,dos,mac              " support all three, in this order
set hidden                                " change buffers without saving
set history=1000                          " history buffer
set modelines=1                           " set modelines to first/last line - modeline is a vim command specific to a file...used in this one to control folding
set nocompatible                          " ward off weird behaviour that comes with various distros
set noundofile                            " disable persistent undo file
set shell=/bin/zsh                        " specify the shell to use
set spell spelllang=en_gb                 " set the spell check language
if s:running_windows                      " remember to check these folders exist
   set backupdir=$HOME/vimfiles/backup    " where to put backup files
   set directory=$HOME/vimfiles/temp      " directory to place swap files in
else
   set backupdir=$HOME/.vim/backup        " where to put backup files
   set directory=$HOME/.vim/temp          " directory to place swap files in
endif

au FocusLost * :wa                        " autosave the file when the focus is lost
" }}}

" vim ui stuff {{{
colorscheme solarized                     " solarize the colours
set guifont=Anonymous\ Pro\ Minus:h15     " set the font for the gui - doesn't affect vim from the commandline (use console settings for that)
set background=dark                       " dark background
set colorcolumn=160                       " display a marker at 160 chars
set laststatus=2                          " Always display the status line, even if only one window is displayed
set lazyredraw                            " redraw only when we need to
set list                                  " show tabs to support their removal
set listchars=tab:>-,trail:-              " show tabs and trailing whitespace
set matchtime=5                           " how many tenths of a second to blink matching brackets for
set noerrorbells                          " shush!
set number                                " display line numbers on the left
set numberwidth=3                         " good up to 1k lines
" set relativenumber                       " Display line numbers relative to the cursor position
set ruler                                 " show current positions along the bottom
set showcmd                               " show command in bottom bar
set showmatch                             " highlight matching brackets
set showmode                              " show insert/command mode
set ttyfast                               " fast terminal
set wildmenu                              " visual autocomplete for command menu - just hit <tab>
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignore these list file extensions
set wildmode=list:longest                 " turn on wild mode huge list
set visualbell                            " blink the screen
" }}}

" text formatting {{{
set autoindent                            " if no specific indent for the file type, keep same indent as current line
set backspace=indent,eol,start            " Allow backspacing over autoindent, line breaks and start of insert action
set expandtab                             " use spaces for tabs
set formatoptions=qrn1                    " 
set ignorecase                            " case insensitive by default
set infercase                             " case inferred by default
set nowrap                                " don't wrap lines
set scrolloff=3                           " keey 3 lines at the top/bottom to maintain context
set shiftwidth=3                          " auto-indent amount when using cindent, >>, << and stuff like that
set smartcase                             " if there are caps, go case-sensitive
set softtabstop=3                         " number of spaces in a tab when editing
set tabstop=3                             " tab treated as 3 spaces for display
" }}}

" folding {{{
set foldenable                            " turn on folding
set foldmethod=indent                     " fold on the indent
set foldlevel=10                          " open most folds by default
set foldnestmax=10                        " 10 nested fold max
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
function SimpleFoldText() " {
   return getline(v:foldstart).' '
endfunction " }
set foldtext=SimpleFoldText()             " Custom fold text function (cleaner than default)
" }}}

" searching {{{
set incsearch                             " search as characters are entered
set hlsearch                              " highlight matches
set gdefault                              " replacements are global by default
" noremap <leader><space> :nohlsearch<CR>  " turn off search highlight
nnoremap <leader><space> :noh<cr>         " turn off search highlight until next search
" nnoremap / /\v                            " support regex searches with magic chars (rather than literals) - this is the default
" vnoremap / /\v
" }}}

" Mappings and shortcuts {{{

" Basics {{{
let mapleader=","
" }}}

" Miscellaneous {{{
nnoremap <tab> %
vnoremap <tab> %

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
vnoremap . :norm.<CR>
inoremap jk <esc>                            " jk as escape
" }}}

" Leader shortcuts {{{
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>n :set nonumber!<CR>
nnoremap <leader>rn :set relativenumber!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>                 " edit vimrc
nnoremap <leader>rc :source $MYVIMRC!<CR>             " reload vimrc
nnoremap <leader>ez :vsp $HOME/.zshrc<CR>                 " edit .zshrc
" }}}

" autocommands {{{

" Rainbow Parens {{{
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
" }}}

" Remember everything (position, folds, etc) {{{
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview
" }}}
" }}}
" Control shortcuts {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}
" }}}



" vim:foldmethod=marker:foldlevel=0
