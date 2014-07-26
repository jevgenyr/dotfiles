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

set splitbelow " More natural window splits
set splitright

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Font

" UI
set t_Co=256
colorscheme molokai
set modeline
set modelines=4
set laststatus=2 " always have status shown
set number " line numbers
set cursorline " hightlight current line
set lcs=tab:▸\ ,trail:·,nbsp:_ "Show invisibles
set hlsearch " highlight searches
set incsearch " highlight first match
set ruler " show the cursor position
set showcmd " show the (partial) command as it’s being typed
set showmode " show the current mode
set title " Show the filename in the window titlebar
set list " show whitespace
set scrolloff=6 " scroll page when at 6 line of end/top

" Commands
let mapleader="," " have a better leader
"set mouse=a " mouse in all modes
set backspace=indent,eol,start " allow bckspace in insert
"set esckeys " allow cursor keys in insert mode
noremap <leader>W :w !sudo tee % > /dev/null<CR> " save a file as root (,W)
noremap <leader>bi :! bundle install<CR>
noremap <leader>r :! rake<CR>
noremap <leader>cuk :! cucumber<CR>
noremap <leader>cu :! composer update<CR>
noremap <leader>ci :! composer install<CR>
noremap <leader>pu :! phpunit<CR>

noremap <leader>nt :NERDTree<CR>
" Ctrl P remapsz
nnoremap <leader>t :CtrlP<enter>
nnoremap <C-t> :CtrlP<enter>

nnoremap <C-J> <C-W><C-J> " Map Ctrl+hjkl to move around splits
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set showtabline=2
nnoremap <C-y> :tab split<CR>
nnoremap <C-i> :tabp<CR>
nnoremap <C-o> :tabn<CR>

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

" Fancy RSpec runner
" Credits: http://blog.santosvelasco.com/2012/07/04/vim-and-rspec-run-the-test-under-the-cursor/
function! RSpecFile()
  execute("!clear && rspec " . expand("%p"))
endfunction
map <leader>R :call RSpecFile() <CR>
command! RSpecFile call RSpecFile()

function! RSpecCurrent()
  execute("!clear && rspec " . expand("%p") . ":" . line("."))
endfunction
map <leader>r :call RSpecCurrent() <CR>
command! RSpecCurrent call RSpecCurrent()

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif