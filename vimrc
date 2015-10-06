" Don't bother supporting vi, update window title, no ~file
set nocompatible title nobackup noswapfile
" Show line number, current line and current command
set number cursorline showcmd
" Search incrementally with smart case sensitivity, highlight all matches
set incsearch ignorecase smartcase hlsearch
" Automatic indentation and adjust with tab and backspace
set autoindent smartindent smarttab
" Shorten messages and disable intro screen
set shortmess=atI
" Disable audible bell
set visualbell t_vb=
" Allow backspace in insert mode, how hard tabs and trailing whitespace
set backspace=2 list listchars=tab:>\ ,trail:·,nbsp:_
" Show hard tabs as 4 wide, use 2 space indentation rounded to multiples
set tabstop=4 expandtab shiftwidth=2 shiftround
" Use mac's clipboard
set clipboard=unnamed
" Show tab-complete suggestions and complete longest substring.
set wildmenu wildmode=list:longest
" Color line 80
set colorcolumn=80
" Use space as leader
let mapleader=" "

" Syntax highlighting, filetype indentation rules, color scheme
syntax on
filetype plugin indent on
colorscheme hybrid " PaperColor

" Various auto commands
autocmd VimResized * :wincmd = " Equalize window sizes on resize
autocmd BufNewFile,BufRead *.md setlocal spell " Help correct my english
autocmd BufNewFile,BufRead *.tag set ft=html " treat riot .tag as html
autocmd BufNewFile,BufRead *.sl set ft=solo " syntax for solo's .sl
autocmd BufNewFile,BufRead *.esl set ft=solo
autocmd BufNewFile,BufRead *.ryl set ft=scheme

" Map Ctrl+hjkl to move around splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

call plug#begin()
" Plugins
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'bufexplorer.zip'
Plug 'ervandew/ag'
Plug 'tpope/vim-fugitive'
Plug 'NLKNguyen/papercolor-theme'

" Languages
Plug 'fatih/vim-go'
Plug 'digitaltoad/vim-jade'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'wting/rust.vim'
Plug 'klen/python-mode'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'dag/vim2hs'
Plug 'dag/vim-fish'
call plug#end()

" Leader commands
nmap <leader>n :nohlsearch<CR>
noremap <leader>nt :NERDTreeToggle<CR>
noremap <leader>be :BufExplorerHorizontalSplit<CR>
noremap <leader>sp :set paste<CR>
noremap <leader>snp :set nopaste<CR>

" Fish shell compat
if &shell =~# 'fish$'
  set shell=sh
endif
