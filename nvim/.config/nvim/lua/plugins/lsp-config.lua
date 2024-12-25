return {
	'neovim/nvim-lspconfig',
	dependencies = { 'hrsh7th/nvim-cmp' },
	config = function()
		local lspconfig = require('lspconfig')
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local language_servers = { 'jsonls', 'ts_ls', 'pyright', 'angularls', 'cssls', 'html', 'lua_ls' }
		for _, value in ipairs(language_servers) do
			lspconfig[value].setup { capabilities = capabilities }
		end

		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
		vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		vim.api.nvim_set_keymap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		vim.api.nvim_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
		vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	end
}
