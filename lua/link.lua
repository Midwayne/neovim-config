local M = {}

local function trim_trailing_punctuation(url)
    return url:gsub('[),.;:!?]+$', '')
end

local function is_url(text)
    return text:match '^https?://' ~= nil or text:match '^ftp://' ~= nil
end

local function url_from_cfile()
    local target = vim.fn.expand '<cfile>'
    if is_url(target) then
        return target
    end
end

local function cursor_col()
    return vim.api.nvim_win_get_cursor(0)[2] + 1
end

local function url_in_range(line, url, col)
    local start_col = line:find(url, 1, true)
    if not start_col then
        return
    end

    local end_col = start_col + #url - 1
    if col >= start_col and col <= end_col then
        return trim_trailing_punctuation(url)
    end
end

local function url_from_line()
    local line = vim.api.nvim_get_current_line()
    local col = cursor_col()

    for url in line:gmatch "https?://[%w%-%.%_%~:/%?%#%[%]@!$&'()*+,;%%]+" do
        local match = url_in_range(line, url, col)
        if match then
            return match
        end
    end

    local pos = 1
    while true do
        local start_col, end_col, _, url = line:find('%[([^%]]*)%]%(([^%)]*)%)', pos)
        if not start_col then
            break
        end

        if col >= start_col and col <= end_col and url ~= '' then
            return url
        end

        pos = end_col + 1
    end

    pos = 1
    while true do
        local start_col, end_col, url = line:find('href%s*=%s*["\']([^"\']+)["\']', pos)
        if not start_col then
            break
        end

        if col >= start_col and col <= end_col and is_url(url) then
            return url
        end

        pos = end_col + 1
    end
end

local function url_from_treesitter()
    if vim.treesitter == nil then
        return
    end

    local ok, node = pcall(vim.treesitter.get_node)
    if not ok or node == nil then
        return
    end

    local current = node
    while current do
        local node_type = current:type()

        if node_type == 'link' then
            for child in current:iter_children() do
                if child:type() == 'link_destination' then
                    local text = vim.treesitter.get_node_text(child, 0)
                    return text:gsub('^<', ''):gsub('>$', '')
                end
            end
        elseif node_type == 'uri_autolink' then
            return trim_trailing_punctuation(vim.treesitter.get_node_text(current, 0))
        elseif node_type == 'attribute' then
            local name_node = current:field('name')[1]
            if name_node and vim.treesitter.get_node_text(name_node, 0) == 'href' then
                local value_node = current:field('value')[1]
                if value_node then
                    local href = vim.treesitter.get_node_text(value_node, 0):gsub('^["\']', ''):gsub('["\']$', '')
                    if is_url(href) then
                        return href
                    end
                end
            end
        end

        current = current:parent()
    end
end

function M.get_url_under_cursor()
    return url_from_cfile() or url_from_treesitter() or url_from_line()
end

function M.open_under_cursor()
    local url = M.get_url_under_cursor()
    if url then
        vim.ui.open(url)
        return true
    end

    vim.notify('No link found under cursor', vim.log.levels.WARN)
    return false
end

return M
