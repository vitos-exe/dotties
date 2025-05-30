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

-- Autosave
local autosave_enabled = false
local group = vim.api.nvim_create_augroup("AutoSaveGroup", { clear = true })

local function toggle_autosave()
  if autosave_enabled then
    vim.api.nvim_clear_autocmds({ group = group })
    autosave_enabled = false
    print("Autosave OFF")
  else
    vim.api.nvim_create_autocmd({"BufLeave", "FocusLost"}, {
      group = group,
      pattern = "*",
      command = "silent! wa"
    })
    autosave_enabled = true
    print("Autosave ON")
  end
end

vim.keymap.set('n', '<leader>a', toggle_autosave, { desc = "Toggle autosave" })

