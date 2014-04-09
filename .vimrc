" Frederic's .vimrc
" https://github.com/kiasaki/dotfiles
call pathogen#infect()

" Behaviors
syntax on
set hidden
set nocompatible " no vi support
set clipboard=unnamed " use mac clipboard
set ttyfast " optimize for fast terminal connections
set encoding=utf-8 nobomb
set binary " no empty line at eof
set noeol " ^
set exrc " per directory .vimrc
set secure " ^ in secure mode
set noerrorbells " no error bells
set nostartofline " no sol while moving
set shortmess=atI " don’t show the intro at startup

set wildmenu " shell style completion
set gdefault " add g flag to search & replace by default
set ignorecase " ignore searches case
set incsearch " dynamicly search

set tabstop=2 " Tab by two
set shiftwidth=2 " ^
set expandtab " ^ (spaces)

" Font

" UI
set background=dark
colorscheme solarized
set modeline
set modelines=4
set laststatus=2 " always have status shown
set number " line numbers
set cursorline " hightlight current line
set lcs=tab:▸\ ,trail:·,nbsp:_ "Show invisibles
set hlsearch " highlight searches
set ruler " show the cursor position
set showcmd " show the (partial) command as it’s being typed
set showmode " show the current mode
set title " Show the filename in the window titlebar
set list " show whitespace
set scrolloff=6 " scroll page when at 6 line of end/top

" Commands
let mapleader="," " have a better leader
set mouse=a " mouse in all modes
set backspace=indent,eol,start " allow bckspace in insert
set esckeys " allow cursor keys in insert mode
noremap <leader>W :w !sudo tee % > /dev/null<CR> " save a file as root (,W)

" Specifics
filetype plugin indent on
set backupdir=~/.vim/backups " centralize
set directory=~/.vim/swaps " centralize
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Buffer explorer config
let g:bufExplorerShowRelativePath=1

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif
