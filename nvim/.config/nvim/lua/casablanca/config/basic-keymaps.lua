local opts = { noremap = true, silent = true }


-- Splits
vim.keymap.set('n', '<C-S>', '<C-W>s', opts)
vim.keymap.set('n', '<C-V>', '<C-W>v', opts)
-- Quit
vim.keymap.set('n', '<C-Q>', '<C-W>q', opts)
