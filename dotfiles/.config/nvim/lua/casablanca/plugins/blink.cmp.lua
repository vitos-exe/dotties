return {
	'saghen/blink.cmp',
	version = '*',
	opts = {
		keymap = {
			preset = 'none',
			['<Tab>'] = { 'select_next', 'fallback' },
			['<S-Tab>'] = { 'select_prev', 'fallback' },
			['<C-e>'] = { 'hide', 'fallback' },
			['<CR>'] = { 'accept', 'fallback' },
		},
		sources = {
			default = { 'lsp', 'path', 'buffer', 'snippets' },
			providers = {
				snippets = {
					opts = {
						friendly_snippets = true,
						extended_filetypes = {
							htmlangular = {'angular'},
							typescript = {'angular'}
						}
					}
				}
			}
		},
		completion = {
			list = {
				selection = { auto_insert = true }
			},
			documentation = {
				auto_show = true
			}
		}
	},
}

