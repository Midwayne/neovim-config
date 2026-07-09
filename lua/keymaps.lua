-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Open URL or markdown/HTML link under cursor in the system browser
vim.keymap.set('n', 'gx', function()
    require('link').open_under_cursor()
end, { desc = 'Open link under cursor' })

-- Multiline editing (visual selection keeps working after indent)
vim.keymap.set('x', '<', '<gv', { desc = 'Indent selection left' })
vim.keymap.set('x', '>', '>gv', { desc = 'Indent selection right' })
vim.keymap.set({ 'n', 'x' }, '<leader>xp', function()
    require('multiline').prefix_lines()
end, { desc = '[P]refix lines' })
vim.keymap.set({ 'n', 'x' }, '<leader>xs', function()
    require('multiline').postfix_lines()
end, { desc = 'Po[s]tfix lines' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
