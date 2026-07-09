return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-mini/mini.nvim',
        },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            -- Helps rendering when opening markdown files directly from the shell.
            restart_highlighter = true,
            completions = {
                blink = { enabled = true },
            },
        },
        keys = {
            { '<leader>tm', '<cmd>RenderMarkdown toggle<cr>', desc = '[T]oggle [M]arkdown render' },
            { '<leader>mp', '<cmd>RenderMarkdown preview<cr>', desc = '[M]arkdown [P]review' },
        },
    },
}
