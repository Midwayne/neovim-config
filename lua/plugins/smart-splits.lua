return {
  'mrjones2014/smart-splits.nvim',
  lazy = false,
  config = function()
    require('smart-splits').setup {
      -- add any config here
    }

    -- Recommended keybindings
    -- Resizing splits
    -- these keymaps will also accept a range,
    -- e.g. - Alt-Arrow will resize the split by 5 (default)
    vim.keymap.set('n', '<A-Left>', require('smart-splits').resize_left, { desc = 'Resize split left' })
    vim.keymap.set('n', '<A-Down>', require('smart-splits').resize_down, { desc = 'Resize split down' })
    vim.keymap.set('n', '<A-Up>', require('smart-splits').resize_up, { desc = 'Resize split up' })
    vim.keymap.set('n', '<A-Right>', require('smart-splits').resize_right, { desc = 'Resize split right' })

    -- Moving between splits
    vim.keymap.set('n', '<C-Left>', require('smart-splits').move_cursor_left, { desc = 'Move to left split' })
    vim.keymap.set('n', '<C-Down>', require('smart-splits').move_cursor_down, { desc = 'Move to down split' })
    vim.keymap.set('n', '<C-Up>', require('smart-splits').move_cursor_up, { desc = 'Move to up split' })
    vim.keymap.set('n', '<C-Right>', require('smart-splits').move_cursor_right, { desc = 'Move to right split' })

    -- Swapping splits
    vim.keymap.set('n', '<leader><leader>Left', require('smart-splits').swap_buf_left, { desc = 'Swap buffer left' })
    vim.keymap.set('n', '<leader><leader>Down', require('smart-splits').swap_buf_down, { desc = 'Swap buffer down' })
    vim.keymap.set('n', '<leader><leader>Up', require('smart-splits').swap_buf_up, { desc = 'Swap buffer up' })
    vim.keymap.set('n', '<leader><leader>Right', require('smart-splits').swap_buf_right, { desc = 'Swap buffer right' })
  end,
}
