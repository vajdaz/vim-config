" Pathogen plugin
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin on
filetype indent on

" Window size for GUI mode
if has("gui_running")
	winsize 120 45
endif

" NERDTree plugin
map <C-n> :NERDTreeToggle<CR>
" Quit if the only buffer is the NERDTree buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" On some terminals NERDTree does not work with arrows on
let g:NERDTreeDirArrows=0
let g:NERDTreeShowBookmarks=1

" EaseyMotion
nmap <c-w> <Leader><Leader>w

" Hide toolbar
set guioptions-=T

" Colorscheme
set background=dark
if has("gui_running") 
    let g:solarized_termcolors=256
else
    let g:solarized_termcolors=16
endif
let g:solarized_contrast="high"
colorscheme solarized

" Enable modified buffers to be hidden
set hidden

" Show row and column in status bar
set ruler

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

" Scrolling left and right (e.g. for diff)
nnoremap <m-Left> zH
nnoremap <m-Right> zL

" Default Indentation
set autoindent
set smartindent     " Indent when
set tabstop=4       " Tab width
set softtabstop=4   " Number of spaces to insert for tab
set shiftwidth=4    " Autoindent space width
set smarttab        " A tab in an indent inserts 'shiftwidth' spaces 

" Shortcut for executing current line as shell command
nnoremap <Leader>xl :execute "Shell " getline(".")<CR>
" :Shell for execute shell command and write output into new window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  " botright new
  tabnew
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
