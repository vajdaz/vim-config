" Pathogen plugin
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin on
filetype indent on

" NERDTree plugin
map <C-n> :NERDTreeToggle<CR>
" Quit if the only buffer is the NERDTree buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" On some terminals NERDTree does not work with arrows on
let g:NERDTreeDirArrows=0
let g:NERDTreeShowBookmarks=1

" Show row and column in status bar
set ruler

" Colorscheme
colorscheme molokai

" Incremental search
set incsearch

" Ignore case when searching if search pattern is lowercase
set ignorecase smartcase

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

" Remap <c-p> to use last mode and dir used
let g:ctrlp_cmd='CtrlPLastMode --dir'
" Ignore files in file name completition and for ctrlp
set wildignore+=*.o,*.obj,*.a,*.a.CR,*.abb,*.abb.CR,*.elf,*.so.*,*~,*.swp,*.dll,*.dll.*,*.exe,*.exe.*,*.amx,*.mof,*.cat,*.rtf,*.class,*.pdf,*.sav,*.dat,*.xls
" Follow symbolic links
let g:ctrlp_follow_symlinks=1
" Keep cache between sessions (use <F5> to clear cache)
let g:ctrlp_clear_cache_on_exit=0

set t_Co=256          " Explicitly tell vim that the terminal has 256 colors "
set nu                " Show line numbers
set showcmd           " Show typed command in status bar
set laststatus=2      " Use 2 lines for the status bar
set matchtime=2       " Show matching bracket for 0.2 seconds
set matchpairs+=<:>   " Specially for html

" Default Indentation
set autoindent
set smartindent     " Indent when
set tabstop=4       " Tab width
set softtabstop=4   " Number of spaces to insert for tab
set shiftwidth=4    " Autoindent space width
set smarttab        " A tab in an indent inserts 'shiftwidth' spaces 
