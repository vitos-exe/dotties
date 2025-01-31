return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=true<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"gr",
			"<cmd> Trouble lsp_references focus=true<cr>",
			desc = "LSP references (Trouble)"
		}
	},
}
