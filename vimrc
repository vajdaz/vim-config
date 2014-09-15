" Pathogen plugin
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin on
filetype indent on

" NERDTree plugin
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" On some terminals NERDTree does not work with arrows on
let g:NERDTreeDirArrows=0
let g:NERDTreeShowBookmarks=1

" Colorscheme
colorscheme molokai

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" Toggle relative line numbers
noremap <c-r> :setl rnu!<CR>

set t_Co=256          " Explicitly tell vim that the terminal has 256 colors "
set nu                " show line numbers
set showcmd           " show typed command in status bar
set laststatus=2      " use 2 lines for the status bar
set matchtime=2       " show matching bracket for 0.2 seconds
set matchpairs+=<:>   " specially for html

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
