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
vim.keymap.set('v', '<', '<gv', { desc = 'Indent selection left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent selection right' })

local function get_line_range()
    local mode = vim.fn.mode()
    if mode == 'v' or mode == 'V' or mode == '\22' then
        -- While still in visual mode, '< / '> are the *previous* selection.
        local start_line = vim.fn.line 'v'
        local end_line = vim.fn.line '.'
        -- Leave visual mode so the input prompt can take focus cleanly.
        local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
        vim.api.nvim_feedkeys(esc, 'nx', false)
        return start_line, end_line
    end

    local start_line = vim.fn.getpos("'<")[2]
    local end_line = vim.fn.getpos("'>")[2]
    if start_line <= 0 or end_line <= 0 then
        local line = vim.fn.line '.'
        return line, line
    end
    return start_line, end_line
end

local function edit_selected_lines(action)
    local start_line, end_line = get_line_range()
    action(start_line, end_line)
end

vim.keymap.set({ 'n', 'x' }, '<leader>lp', function()
    edit_selected_lines(require('multiline').prefix_lines)
end, { desc = '[L]ine [P]refix' })
vim.keymap.set({ 'n', 'x' }, '<leader>ls', function()
    edit_selected_lines(require('multiline').postfix_lines)
end, { desc = '[L]ine [S]uffix' })
vim.keymap.set({ 'n', 'x' }, '<leader>lP', function()
    edit_selected_lines(require('multiline').remove_prefix_lines)
end, { desc = '[L]ine remove [P]refix' })
vim.keymap.set({ 'n', 'x' }, '<leader>lS', function()
    edit_selected_lines(require('multiline').remove_postfix_lines)
end, { desc = '[L]ine remove [S]uffix' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
