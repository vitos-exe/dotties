vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.wrap = false
vim.opt.foldmethod = 'marker'
vim.opt.foldlevel = 0

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>cb', ':bd<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':bnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader><S-Tab>', ':bprev<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>sh', ':sp<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>sv', ':vsp<CR>', opts)

vim.g.copilot_enabled = false

