return {
    { -- Single tabpage interface for easily cycling through diffs for all modified files
        'sindrets/diffview.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('diffview').setup {
                -- Configuration options can be added here
                -- See :help diffview-config for all options
            }

            -- Keymaps for diffview
            vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<CR>', { desc = '[G]it [D]iffview open' })
            vim.keymap.set('n', '<leader>gD', '<cmd>DiffviewClose<CR>', { desc = '[G]it [D]iffview close' })
            vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory<CR>', { desc = '[G]it [H]istory' })
            vim.keymap.set('n', '<leader>gH', '<cmd>DiffviewFileHistory %<CR>', { desc = '[G]it [H]istory current file' })
        end,
    },
}
