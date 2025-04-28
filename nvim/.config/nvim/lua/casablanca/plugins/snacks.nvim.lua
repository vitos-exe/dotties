return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		dashboard = { enabled = true },
		indent = { enabled = true },
		words = { enabled = true },
		explorer = { enabled = true, replace_netrw = true },
	},
	keys = {
		{ "<leader>bd",  function() Snacks.bufdelete() end,               desc = "Delete Buffer" },
		{ "<leader>bdA", function() Snacks.bufdelete.all() end,           desc = "Delete All Buffers" },
		{ "<leader>cR",  function() Snacks.rename.rename_file() end,      desc = "Rename File" },
		{ "<leader>gb",  function() Snacks.git.blame_line() end,          desc = "Git Blame Line" },
		{ "<leader>gf",  function() Snacks.lazygit.log_file() end,        desc = "Lazygit Current File History" },
		{ "<leader>gg",  function() Snacks.lazygit() end,                 desc = "Lazygit" },
		{ "]]",          function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",              mode = { "n", "t" } },
		{ "[[",          function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",              mode = { "n", "t" } },
		{ "-",           function() Snacks.explorer.open() end,           desc = "Open Explorer", },
		{ "<leader>t",   function() Snacks.terminal.open() end,           desc = "Open Terminal", },
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command
			end,
		})
	end,
}
