" Don't bother supporting vi, update window title, no ~file
set nocompatible title nobackup noswapfile
" Show line number, current line and current command
set number cursorline showcmd
" Search incrementally with smart case sensitivity, highlight all matches
set incsearch ignorecase smartcase hlsearch
" Automatic indentation and adjust with tab and backspace
set autoindent smartindent smarttab
" Shorten messages and disable intro screen and disable audible bell
set shortmess=atI visualbell t_vb=
" Allow backspace in insert mode, show hard tabs and trailing whitespace
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
set background=dark
colorscheme solarized

" Various auto commands
autocmd VimResized * :wincmd = " Equalize window sizes on resize
autocmd BufNewFile,BufRead *.md setlocal spell " Help correct my english
autocmd BufNewFile,BufRead *.tag set filetype=html " treat riot .tag as html
autocmd BufNewFile,BufRead *.scm set filetype=scheme
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Angular templates
autocmd BufNewFile *.directive.js 0r ~/.vim/templates/template.directive.js
autocmd BufNewFile *.directive.spec.js 0r ~/.vim/templates/template.directive.spec.js
autocmd BufNewFile *.serivce.js 0r ~/.vim/templates/template.service.js
autocmd BufNewFile *.service.spec.js 0r ~/.vim/templates/template.service.spec.js
autocmd BufNewFile *.api.js 0r ~/.vim/templates/template.api.js
autocmd BufNewFile *.api.spec.js 0r ~/.vim/templates/template.api.spec.js
autocmd BufNewFile *.model.js 0r ~/.vim/templates/template.model.js
autocmd BufNewFile *.model.spec.js 0r ~/.vim/templates/template.model.spec.js
autocmd BufNewFile *.controller.js 0r ~/.vim/templates/template.controller.js
autocmd BufNewFile *.controller.spec.js 0r ~/.vim/templates/template.controller.spec.js
autocmd BufNewFile *.filter.js 0r ~/.vim/templates/template.filter.js
autocmd BufNewFile *.filter.spec.js 0r ~/.vim/templates/template.filter.spec.js

" Map Ctrl+[hjkl] to move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
if has("nvim") " In nvim, move out of the terminal easier
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
end

" Plugin options
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules',
  \ 'file': '\.exe$\|\.so$\|\.DS_Store',
  \ }

call plug#begin()
" Plugins
Plug 'ervandew/ag'
Plug 'bufexplorer.zip'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'mephux/vim-jsfmt'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'NLKNguyen/papercolor-theme'
Plug 'editorconfig/editorconfig-vim'

" Languages
Plug 'dag/vim2hs'
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go'
Plug 'dag/vim-fish'
Plug 'elzr/vim-json'
Plug 'wting/rust.vim'
Plug 'klen/python-mode'
Plug 'wavded/vim-stylus'
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'Glench/Vim-Jinja2-Syntax'
call plug#end()

" Leader commands
nmap <leader>n :nohlsearch<CR>
noremap <leader>nt :NERDTreeToggle<CR>
noremap <leader>be :BufExplorerHorizontalSplit<CR>
noremap <leader>sp :set paste<CR>
noremap <leader>snp :set nopaste<CR>
