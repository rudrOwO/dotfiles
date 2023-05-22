nnoremap Y y$
set clipboard+=unnamedplus
set nrformats+=alpha

if exists('g:vscode')
    "nnoremap <silent> gd :call VSCodeNotify('editor.action.revealDefinition')<CR>
    nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
endif

inoremap {<cr> {<cr>}<c-o><s-o>
inoremap kj <Esc>

filetype plugin indent on

"set t_Co=256
set noshowmode
set background=dark    
set termguicolors
set number
set number
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set cursorline
set mouse=a

call plug#begin ('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Theme Customizations
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'olivercederborg/poimandres.nvim'
Plug 'tpope/vim-surround'
call plug#end ()

let g:airline_theme='minimalist'
let g:material_theme_style='darker'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='hard'
let g:airline_powerline_fonts=1

colorscheme ayu

"Auto-save on focus change
"au FocusLost * :wa
"Using Transparent Background
hi Normal guibg=NONE ctermbg=NONE
