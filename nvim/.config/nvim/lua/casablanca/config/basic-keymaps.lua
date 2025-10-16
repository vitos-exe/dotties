local opts = { noremap = true, silent = true }

-- Key mappings for easier window navigation
vim.keymap.set('n', '<C-H>', '<C-W>h', opts)
vim.keymap.set('n', '<C-J>', '<C-W>j', opts)
vim.keymap.set('n', '<C-K>', '<C-W>k', opts)
vim.keymap.set('n', '<C-L>', '<C-W>l', opts)
-- Splits
vim.keymap.set('n', '<C-S>', '<C-W>s', opts)
vim.keymap.set('n', '<C-V>', '<C-W>v', opts)
-- Quit
vim.keymap.set('n', '<C-Q>', '<C-W>q', opts)
