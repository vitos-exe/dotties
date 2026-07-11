-- Autosave
local autosave_enabled = false
local function toggle_autosave()
	if autosave_enabled then
		autosave_enabled = false
		print("Autosave OFF")
	else
		vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
			pattern = "*",
			callback = function ()
				require('conform').format()
				vim.api.nvim_command("wa")
			end
		})
		autosave_enabled = true
		print("Autosave ON")
	end
end
-- vim.keymap.set('n', '<leader>a', toggle_autosave, { desc = "Toggle autosave" })

