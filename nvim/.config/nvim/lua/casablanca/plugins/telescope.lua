return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Telescope find marks' })
        vim.keymap.set('n', '<leader>fp', builtin.planets, { desc = 'Telescope list planets' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope list keymaps' })
        vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = 'Telescope find git commits' })
        vim.keymap.set('n', '<leader>d', builtin.diagnostics, { desc = 'Telescope diagnostics' })
    end
}
