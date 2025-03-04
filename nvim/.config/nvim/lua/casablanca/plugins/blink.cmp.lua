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
			default = { 'lsp', 'path', 'buffer' },
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

