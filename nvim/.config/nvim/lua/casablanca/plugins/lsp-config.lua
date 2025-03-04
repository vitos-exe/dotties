return {
	'neovim/nvim-lspconfig',
	dependencies = { 'saghen/blink.cmp' },
	config = function()
		local lspconfig = require('lspconfig')
		local capabilities = require('blink.cmp').get_lsp_capabilities()
		local language_servers = { 'jsonls', 'ts_ls', 'pyright', 'angularls', 'cssls', 'html', 'lua_ls' }
		for _, value in ipairs(language_servers) do
			lspconfig[value].setup { capabilities = capabilities }
		end

		lspconfig.angularls.setup {
			capabilities = capabilities,
			-- on_attach = function()
			-- 	for i, server in ipairs(vim.lsp.buf_get_clients()) do
			-- 		print(server.name)
			-- 		if server.name == 'ts_ls' then
			-- 			vim.lsp.get_client_by_id(server.id).stop()
			-- 		end
			-- 	end
			-- end
		}

		lspconfig.lua_ls.setup {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT'
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME
							-- Depending on the usage, you might want to add additional paths here.
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						}
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
						-- library = vim.api.nvim_get_runtime_file("", true)
					}
				})
			end,
			settings = {
				Lua = {}
			}
		}

		local opts = { noremap = true, silent = true }
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
		-- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		vim.keymap.set('n', '<leader>o', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
	end
}
