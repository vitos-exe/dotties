vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"

vim.opt.number       = true
vim.opt.wrap         = false
vim.opt.foldlevel    = 99

-- For some reason simply settings those options at the startup doesn't work
-- So here is this keybind that resets folding so it works when I need it
local function set_treesitter_foldexpr()
	vim.opt_local.foldmethod = 'expr'
	vim.opt_local.foldexpr   = 'v:lua.vim.treesitter.foldexpr()'
	print("Folding method set to Tree-sitter (expr)")
	vim.cmd("normal! zv") -- Re-evaluate folds immediately
end
vim.keymap.set('n', '<Leader>tsf', set_treesitter_foldexpr, { desc = "Set Tree-sitter Folding" })

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<leader><Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<leader><S-Tab>', ':bprev<CR>', opts)

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
		vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
			group = group,
			pattern = "*",
			command = "silent! wa"
		})
		autosave_enabled = true
		print("Autosave ON")
	end
end
vim.keymap.set('n', '<leader>a', toggle_autosave, { desc = "Toggle autosave" })

-- LSP
vim.keymap.set('n', 'gro', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.lsp.enable({
	'lua_ls',
	'angularls',
	'ts_ls',
	'html',
	'cssls'
})

-- Delete all buffers except opened ones
local function delete_hidden_buffers()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.fn.bufwinnr(buf) == -1 then
			vim.api.nvim_buf_delete(buf, {})
		end
	end
	print("Hidden buffers deleted")
end
vim.keymap.set('n', '<leader>bdh', delete_hidden_buffers, { desc = 'Delete hidden buffers' })
