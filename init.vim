filetype plugin indent on

set noshowmode
set background=dark    
set termguicolors
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline


"Remaps
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>
inoremap ii <Esc>
vnoremap ii <Esc>

call plug#begin ('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'

"Theme Customizations
Plug 'ajmwagar/vim-deus'
Plug 'gosukiwi/vim-atom-dark'

call plug#end ()


let g:airline_theme='deus'


colorscheme atom-dark

"Auto-save on focus change
au FocusLost * :wa

"Transparency
hi Normal guibg=NONE ctermbg=NONE
