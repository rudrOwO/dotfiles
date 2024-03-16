-- Key mapping
vim.api.nvim_set_keymap('n', 'Y', 'y$', {})
vim.opt.clipboard:append('unnamedplus')
vim.opt.nrformats:append('alpha')

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Check if running in VSCode
if vim.fn.exists('g:vscode') == 1 then
    vim.api.nvim_set_keymap('n', '<Space>', ':call VSCodeNotify("whichkey.show")<CR>', {silent=true})

    require('lazy').setup({
        { 'tpope/vim-surround' },
    })
else
    -- Key mappings in insert mode
    vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<C-o><S-o>', {})
    vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})

    -- Filetype settings
    vim.cmd('filetype plugin indent on')

    -- General settings
    vim.opt.termguicolors = true
    vim.opt.number = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.smartindent = true
    vim.opt.cursorline = true
    vim.opt.mouse = 'a'

    require('lazy').setup({
        { 'EdenEast/nightfox.nvim' },
        { 'olivercederborg/poimandres.nvim' },
        { 'vim-airline/vim-airline' },
        { 'vim-airline/vim-airline-themes' },
        { 'tpope/vim-surround' },
    })

    -- Plugin-specific settings
    vim.g.airline_theme = 'minimalist'
    vim.g.airline_powerline_fonts = 1

    -- Theme settings
    vim.cmd('colorscheme poimandres')
end

-- Auto-save on focus change (uncomment if needed)
-- vim.cmd('autocmd FocusLost * :wa')

-- Transparent background
-- vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
