return {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
        require('toggleterm').setup {
            open_mapping = [[<leader>tt]],
            direction = 'float',
            float_opts = {
                border = 'curved',
            },
        }

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], vim.tbl_extend('force', opts, { desc = 'Exit terminal mode' }))
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], vim.tbl_extend('force', opts, { desc = 'Exit terminal mode' }))
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], vim.tbl_extend('force', opts, { desc = 'Terminal: focus left window' }))
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], vim.tbl_extend('force', opts, { desc = 'Terminal: focus lower window' }))
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], vim.tbl_extend('force', opts, { desc = 'Terminal: focus upper window' }))
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], vim.tbl_extend('force', opts, { desc = 'Terminal: focus right window' }))
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], vim.tbl_extend('force', opts, { desc = 'Terminal: window command' }))
        end

        vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
    end,
}
