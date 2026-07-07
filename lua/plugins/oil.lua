return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            default_file_explorer = true,
        },
        dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
        lazy = false,
        keys = {
            {
                '\\',
                function()
                    require('oil').toggle_float()
                end,
                desc = '[O]il file browser',
            },
        },
    },
}
