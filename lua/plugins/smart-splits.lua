return {
    'mrjones2014/smart-splits.nvim',
    event = { 'VeryLazy' },
    config = function()
        require('smart-splits').setup {}

        vim.keymap.set('n', '<A-Left>', require('smart-splits').resize_left, { desc = '[W]indow: resize left' })
        vim.keymap.set('n', '<A-Down>', require('smart-splits').resize_down, { desc = '[W]indow: resize down' })
        vim.keymap.set('n', '<A-Up>', require('smart-splits').resize_up, { desc = '[W]indow: resize up' })
        vim.keymap.set('n', '<A-Right>', require('smart-splits').resize_right, { desc = '[W]indow: resize right' })

        vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left, { desc = '[W]indow: focus left' })
        vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down, { desc = '[W]indow: focus down' })
        vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up, { desc = '[W]indow: focus up' })
        vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right, { desc = '[W]indow: focus right' })

        vim.keymap.set('n', '<leader><leader>Left', require('smart-splits').swap_buf_left, { desc = '[W]indow: swap buffer left' })
        vim.keymap.set('n', '<leader><leader>Down', require('smart-splits').swap_buf_down, { desc = '[W]indow: swap buffer down' })
        vim.keymap.set('n', '<leader><leader>Up', require('smart-splits').swap_buf_up, { desc = '[W]indow: swap buffer up' })
        vim.keymap.set('n', '<leader><leader>Right', require('smart-splits').swap_buf_right, { desc = '[W]indow: swap buffer right' })
    end,
}
