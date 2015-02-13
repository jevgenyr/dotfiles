set nocompatible

" Backspace past beginning of line in insert mode.
set backspace=indent,eol,start

" Allow switching buffers without saving.
set hidden

" Show cursor position and incomplete commands, always show status line.
set ruler showcmd laststatus=2

" Search incrementally with smart case sensitivity, highlight all matches.
set incsearch ignorecase smartcase hlsearch

" Automatic indentation and adjust with tab and backspace.
set autoindent smartindent smarttab

" Show line numbers, highlight current line and fixed columns.
set number cursorline colorcolumn=80,100,120

" Set window title.
set title

" Shorten messages and disable intro screen
set shortmess=atI

" Disable audible bell.
set visualbell t_vb=

" Show hard tabs and trailing whitespace
set list listchars=tab:»·,trail:·

" Show hard tabs as 4 side, use 2 space indentation rounded to multiples.
set tabstop=4 expandtab shiftwidth=2 shiftround

" Syntax highlighting, filetype indentation rules.
syntax on
filetype plugin indent on

" Show tab-complete suggestions and complete longest substring.
set wildmenu wildmode=list:longest

" Swap , and \ for leader.
noremap \ ,
let mapleader=","

" Clear search results.
nmap <leader>n :nohlsearch<CR>

colorscheme peachpuff
