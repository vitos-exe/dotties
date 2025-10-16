-- Autosave
local autosave_enabled = false
local function toggle_autosave()
	if autosave_enabled then
		autosave_enabled = false
		print("Autosave OFF")
	else
		vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
			pattern = "*",
			command = "silent! wa"
		})
		autosave_enabled = true
		print("Autosave ON")
	end
end
vim.keymap.set('n', '<leader>a', toggle_autosave, { desc = "Toggle autosave" })

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

-- For some reason simply settings those options at the startup doesn't work
-- So here is this keybind that resets folding so it works when I need it
local function set_treesitter_foldexpr()
	vim.opt_local.foldmethod = 'expr'
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	vim.cmd("normal! zv") -- Re-evaluate folds immediately
	print("Folding method set to Tree-sitter (expr)")
end
vim.keymap.set('n', '<Leader>tsf', set_treesitter_foldexpr, { desc = "Set Tree-sitter Folding" })
