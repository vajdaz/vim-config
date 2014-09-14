" Pathogen plugin
execute pathogen#infect()
syntax on
filetype plugin on
filetype indent on

"NERDTree plugin
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Colorscheme
colorscheme molokai
