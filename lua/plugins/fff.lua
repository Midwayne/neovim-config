return {
    {
        'dmtrKovalenko/fff',
        build = function()
            require('fff.download').download_or_build_binary()
        end,
        keys = {
            {
                '<leader>sg',
                function()
                    require('fff').live_grep()
                end,
                desc = '[S]earch by [G]rep',
            },
            {
                '<leader>sw',
                function()
                    require('fff').live_grep_under_cursor()
                end,
                mode = { 'n', 'x' },
                desc = '[S]earch current [W]ord',
            },
            {
                '<leader>s/',
                function()
                    local paths = {}
                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == '' then
                            local name = vim.api.nvim_buf_get_name(buf)
                            if name ~= '' then
                                table.insert(paths, vim.fn.fnamemodify(name, ':~:.'))
                            end
                        end
                    end

                    if #paths == 0 then
                        vim.notify('No open files to search', vim.log.levels.WARN)
                        return
                    end

                    require('fff').live_grep {
                        title = 'Live Grep in Open Files',
                        query = table.concat(paths, ' ') .. ' ',
                    }
                end,
                desc = '[S]earch [/] in Open Files',
            },
        },
    },
}
