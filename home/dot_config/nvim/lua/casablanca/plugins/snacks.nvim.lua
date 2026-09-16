return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		dashboard = { enabled = true },
		indent = { enabled = true },
		explorer = { enabled = true, replace_netrw = true },
	},
	keys = {
		{ "<leader>gb", function() Snacks.git.blame_line() end,               desc = "Git Blame Line" },
		{ "<leader>gf", function() Snacks.lazygit.log_file() end,             desc = "Lazygit Current File History" },
		{ "-",          function() Snacks.explorer.open() end,                desc = "Open Explorer", },
		{ "<leader>t",  function() Snacks.terminal.open() end,                desc = "Open Terminal", },

		{ "<leader>ff", function() Snacks.picker.files() end,                 desc = "Find Files" },
		{ "<leader>fb", function() Snacks.picker.buffers() end,               desc = "Buffers" },
		{ "<leader>fp", function() Snacks.picker.projects() end,              desc = "Projects" },
		{ "<leader>sg", function() Snacks.picker.grep() end,                  desc = "Grep" },
		{ "<leader>fp", function() Snacks.picker.projects() end,              desc = "Projects" },
		{ "grs",        function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
	},
}
