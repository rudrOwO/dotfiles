filetype plugin indent on

set noshowmode
set background=dark    
set termguicolors
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set cursorline


"Remaps
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap ii <Esc>
vnoremap ii <Esc>
cnoremap ii <Esc>

call plug#begin ('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
"Theme Customizations
Plug 'ajmwagar/vim-deus'
Plug 'gosukiwi/vim-atom-dark'
Plug 'ayu-theme/ayu-vim'
call plug#end ()

let g:airline_theme='deus'
let ayucolor="dark"

colorscheme ayu

"Auto-save on focus change
au FocusLost * :wa

"Transparency
hi Normal guibg=NONE ctermbg=NONE
