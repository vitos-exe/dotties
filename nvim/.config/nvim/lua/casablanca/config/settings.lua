vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.wrap = false
vim.opt.foldmethod = 'marker'
vim.opt.foldlevel = 0

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<leader><Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<leader><S-Tab>', ':bprev<CR>', opts)
vim.keymap.set('n', '<leader>sh', ':sp<CR>', opts)
vim.keymap.set('n', '<leader>sv', ':vsp<CR>', opts)

-- Key mappings for easier window navigation
vim.keymap.set('n', '<C-H>', '<C-W>h', opts)
vim.keymap.set('n', '<C-J>', '<C-W>j', opts)
vim.keymap.set('n', '<C-K>', '<C-W>k', opts)
vim.keymap.set('n', '<C-L>', '<C-W>l', opts)


vim.g.copilot_enabled = false

