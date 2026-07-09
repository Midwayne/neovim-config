local M = {}

local function get_line_range()
    local start_line = vim.fn.line "'<"
    local end_line = vim.fn.line "'>"

    if start_line > 0 and end_line > 0 then
        if start_line > end_line then
            start_line, end_line = end_line, start_line
        end
        return start_line, end_line
    end

    local line = vim.fn.line '.'
    return line, line
end

local function restore_visual_selection(start_line, end_line)
    local last_col = math.max(vim.fn.col { end_line, '$' } - 1, 1)
    vim.fn.setpos("'<", { 0, start_line, 1, 0 })
    vim.fn.setpos("'>", { 0, end_line, last_col, 0 })
    vim.cmd 'normal! gv'
end

local function update_lines(start_line, end_line, transform)
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
    for index, line in ipairs(lines) do
        lines[index] = transform(line)
    end
    vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
end

function M.prefix_lines()
    local start_line, end_line = get_line_range()

    vim.ui.input({ prompt = 'Prefix lines with: ' }, function(text)
        if text == nil or text == '' then
            return
        end

        update_lines(start_line, end_line, function(line)
            local indent, content = line:match '^(%s*)(.*)$'
            return indent .. text .. content
        end)

        restore_visual_selection(start_line, end_line)
    end)
end

function M.postfix_lines()
    local start_line, end_line = get_line_range()

    vim.ui.input({ prompt = 'Postfix lines with: ' }, function(text)
        if text == nil or text == '' then
            return
        end

        update_lines(start_line, end_line, function(line)
            local content, trailing = line:match '^(.-)(%s*)$'
            return content .. text .. trailing
        end)

        restore_visual_selection(start_line, end_line)
    end)
end

return M
