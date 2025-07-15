return {
	"folke/trouble.nvim",
	config = true,
	cmd = "Trouble",
	keys = {
		{
			"grd",
			"<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"grr",
			"<cmd> Trouble lsp_references focus=true<cr>",
			desc = "LSP references (Trouble)"
		}
	},
}
