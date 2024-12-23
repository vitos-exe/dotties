-- init.lua --



-- Settings {{{

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.wrap = false
vim.opt.foldmethod = 'marker'
vim.opt.foldlevel = 0

vim.cmd.colorscheme "vscode"

vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cb', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><S-Tab>', ':bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>R', ':luafile $MYVIMRC<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', ':sp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', ':vsp<CR>', { noremap = true, silent = true })

-- }}}



-- packer.nvim {{{

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
	-- Packer can manage itself
	use {
		'wbthomason/packer.nvim'
	}

	use {
		'nvim-treesitter/nvim-treesitter'
	}


	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	use {
		'neovim/nvim-lspconfig'
	}


	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
			'hrsh7th/cmp-buffer', -- Buffer completions
			'hrsh7th/cmp-path', -- Path completions
			'hrsh7th/cmp-cmdline', -- Cmdline completions
			'hrsh7th/cmp-vsnip', -- Snippet completions
			'hrsh7th/vim-vsnip', -- Snippet engine
			'hrsh7th/cmp-nvim-lua', -- Neovim Lua API completions
		}
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons', opt = true
		}
	}

	use {
		'lewis6991/gitsigns.nvim'
	}

	use {
		'catppuccin/nvim', as = 'catppuccin'
	}

	use {
		'tpope/vim-commentary'
	}

	use {
		'andymass/vim-matchup',
		setup = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end
	}

	use {
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function()
			require('nvim-autopairs').setup {}
		end
	}

	use {
		'Mofiqul/vscode.nvim'
	}

	use {
		'RishabhRD/nvim-lsputils',
		requires = { 'RishabhRD/popfix' },
        }

	use {
		'rebelot/kanagawa.nvim'
	}

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require('packer').sync()
	end
end)

-- }}}



-- nvim-treesitter {{{

require 'nvim-treesitter.configs'.setup {
	highlight = { enable = true },
	indent = { enable = true }
}

-- }}}



-- telescope.nvim {{{

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Telescope find marks' })
vim.keymap.set('n', '<leader>fp', builtin.planets, { desc = 'Telescope list planets' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope list keymaps' })
vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = 'Telescope find git commits' })
vim.keymap.set('n', '<leader>d',  builtin.diagnostics, { desc = 'Telescope diagnostics' })

-- }}}



-- nvim-cmp {{{
local cmp = require 'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept the selected item
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
	},
	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'vsnip' },
		},
		{
			{ name = 'buffer' },
		})
})

-- }}}



-- nvim-lspconfig {{{

local lspconfig = require('lspconfig')



-- Function to set up key mappings when the LSP server attaches to the buffer
local on_attach = function(_, bufnr)
	-- Helper function to simplify setting keybindings
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local opts = { noremap = true, silent = true }

	-- LSP keybindings
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())



-- Customize the hover window border
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single" -- or you can use "rounded", "double", "shadow", etc.
})

-- Set a black border color for the hover window
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#000000', bg = 'None' }) -- Black border

local lsputils = {
    code_action = require'lsputil.codeAction'.code_action_handler,
    references = require'lsputil.locations'.references_handler,
    definition = require'lsputil.locations'.definition_handler,
    declaration = require'lsputil.locations'.declaration_handler,
    typeDefinition = require'lsputil.locations'.typeDefinition_handler,
    implementation = require'lsputil.locations'.implementation_handler,
    document_symbol = require'lsputil.symbols'.document_handler,
    workspace_symbol = require'lsputil.symbols'.workspace_handler,
}

vim.lsp.handlers["textDocument/codeAction"] = lsputils.code_action
vim.lsp.handlers["textDocument/references"] = lsputils.references
vim.lsp.handlers["textDocument/definition"] = lsputils.definition
vim.lsp.handlers["textDocument/declaration"] = lsputils.declaration
vim.lsp.handlers["textDocument/typeDefinition"] = lsputils.typeDefinition
vim.lsp.handlers["textDocument/implementation"] = lsputils.implementation
vim.lsp.handlers["textDocument/documentSymbol"] = lsputils.document_symbol
vim.lsp.handlers["workspace/symbol"] = lsputils.workspace_symbol

lspconfig.jsonls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.ts_ls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.pyright.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.angularls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.cssls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.html.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.lua_ls.setup {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
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

-- }}}



-- lualine.nvim {{{

require('lualine').setup()

-- }}}



-- gitsigns.nvim {{{

require('gitsigns').setup()

-- }}}

