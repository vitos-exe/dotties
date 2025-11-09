-- LSP
vim.keymap.set('n', 'grr', function() Snacks.picker.lsp_references({layout = 'ivy'}) end, opts)
vim.keymap.set('n', 'gri', function() Snacks.picker.lsp_implementations({layout = 'ivy'}) end, opts)
vim.keymap.set('n', 'grd', function() Snacks.picker.diagnostics_buffer({layout = 'ivy_split'}) end, opts)
vim.keymap.set('n', 'grs', function() Snacks.picker.lsp_symbols() end, opts)
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.keymap.set('n', 'F', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
vim.lsp.enable({
	'lua_ls',
	'ts_ls',
	'html',
	'cssls',
	'pyright',
	'jsonls',
	'docker_language_server'
})

