return {
  -- Kanagawa colorscheme
  {
    'rebelot/kanagawa.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('kanagawa').setup {
        compile = false, -- set true to compile the colorscheme for faster startup
        undercurl = true, -- enable undercurls
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors)
          return {}
        end,
        theme = 'dragon',
        background = {
          dark = 'dragon',
          light = 'lotus',
        },
      }

      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
}
