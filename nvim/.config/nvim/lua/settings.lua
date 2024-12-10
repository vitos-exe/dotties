vim.g.mapleader = " "

-- Show line numbers
vim.opt.number=true

-- The current colorscheme
vim.cmd.colorscheme "vscode"

-- Keybinding for writing tothe buffer
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', {noremap = true, silent = true})

vim.opt.wrap = false

vim.api.nvim_set_keymap('n', '<leader><Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><S-Tab>', ':bprev<CR>', { noremap = true, silent = true })

