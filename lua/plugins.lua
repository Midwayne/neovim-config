require('lazy').setup({
    require 'plugins.guess-indent',
    require 'plugins.gitsigns',
    require 'plugins.diffview',
    require 'plugins.which-key',
    require 'plugins.telescope',
    require 'plugins.fff',
    require 'plugins.harpoon',
    require 'plugins.oil',
    require 'plugins.opencode',
    require 'plugins.lazydev',
    require 'plugins.lspconfig',
    require 'plugins.conform',
    require 'plugins.blink',
    require 'plugins.kanagawa',
    require 'plugins.todo-comments',
    require 'plugins.mini',
    require 'plugins.treesitter',
    require 'plugins.render-markdown',
    -- require 'plugins.debug',
    require 'plugins.indent_line',
    require 'plugins.lint',
    require 'plugins.autopairs',
    require 'plugins.toggleterm',
    require 'plugins.smart-splits',

    -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
    --    This is the easiest way to modularize your config.
    --
    --  Uncomment the following line and add plugins to `lua/custom/plugins/*.lua` to get going.
    -- { import = 'custom.plugins' },
    --
    -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
    -- Or use telescope!
    -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
    -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
})
