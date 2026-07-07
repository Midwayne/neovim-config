return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
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
