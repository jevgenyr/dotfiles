" Don't bother supporting vi, update window title, no ~file
set nocompatible title nobackup
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
" Use space as leader
let mapleader=" "

" Syntax highlighting, filetype indentation rules, color scheme
syntax on
filetype plugin indent on
colorscheme desert

" Various auto commands
autocmd VimResized * :wincmd = " Equalize window sizes on resize
autocmd BufNewFile,BufRead *.md setlocal spell " Help correct my english

" Map Ctrl+hjkl to move around splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

call plug#begin()
" Plugins
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'bufexplorer.zip'
Plug 'ervandew/ag'

" Languages
Plug 'fatih/vim-go'
Plug 'othree/yajs.vim'
Plug 'digitaltoad/vim-jade'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'wting/rust.vim'
Plug 'klen/python-mode'
call plug#end()

" Leader commands
nmap <leader>n :nohlsearch<CR>
noremap <leader>nt :NERDTreeToggle<CR>
noremap <leader>be :BufExplorerHorizontalSplit<CR>
noremap <leader>sp :set paste<CR>
noremap <leader>snp :set nopaste<CR>
