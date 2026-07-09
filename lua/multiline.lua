local M = {}

local function normalize_range(start_line, end_line)
    if start_line == nil or end_line == nil or start_line <= 0 or end_line <= 0 then
        local line = vim.fn.line '.'
        return line, line
    end

    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    return start_line, end_line
end

local function restore_visual_selection(start_line, end_line)
    local last_col = math.max(vim.fn.col { end_line, '$' } - 1, 1)
    vim.fn.setpos("'<", { 0, start_line, 1, 0 })
    vim.fn.setpos("'>", { 0, end_line, last_col, 0 })
    vim.cmd 'normal! gv'
end

local function update_lines(start_line, end_line, transform)
    local lines = vim.fn.getline(start_line, end_line)
    for index, line in ipairs(lines) do
        lines[index] = transform(line)
    end
    vim.fn.setline(start_line, lines)
end

local function edit_lines(start_line, end_line, prompt, transform)
    start_line, end_line = normalize_range(start_line, end_line)

    -- Defer past which-key / visual-mode teardown so the cmdline prompt can accept keys.
    vim.schedule(function()
        local canceled = vim.NIL
        local ok, text = pcall(vim.fn.input, {
            prompt = prompt,
            cancelreturn = canceled,
        })
        if not ok or text == nil or text == canceled or text == '' then
            return
        end

        update_lines(start_line, end_line, function(line)
            return transform(line, text)
        end)

        restore_visual_selection(start_line, end_line)
    end)
end

function M.prefix_lines(start_line, end_line)
    edit_lines(start_line, end_line, 'Prefix lines with: ', function(line, text)
        local indent, content = line:match '^(%s*)(.*)$'
        return indent .. text .. content
    end)
end

function M.postfix_lines(start_line, end_line)
    edit_lines(start_line, end_line, 'Postfix lines with: ', function(line, text)
        local content, trailing = line:match '^(.-)(%s*)$'
        return content .. text .. trailing
    end)
end

function M.remove_prefix_lines(start_line, end_line)
    edit_lines(start_line, end_line, 'Remove prefix: ', function(line, text)
        local indent, content = line:match '^(%s*)(.*)$'
        if vim.startswith(content, text) then
            return indent .. content:sub(#text + 1)
        end
        return line
    end)
end

function M.remove_postfix_lines(start_line, end_line)
    edit_lines(start_line, end_line, 'Remove suffix: ', function(line, text)
        local content, trailing = line:match '^(.-)(%s*)$'
        if vim.endswith(content, text) then
            return content:sub(1, #content - #text) .. trailing
        end
        return line
    end)
end

return M
