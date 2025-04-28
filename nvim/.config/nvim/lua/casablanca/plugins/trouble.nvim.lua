return {
	"folke/trouble.nvim",
	config = true,
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=true win.size=100<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"gr",
			"<cmd> Trouble lsp_references focus=true<cr>",
			desc = "LSP references (Trouble)"
		}
	},
}
