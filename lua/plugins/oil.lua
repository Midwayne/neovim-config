return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    lazy = false,
    keys = {
      {
        '\\',
        function()
          require('oil').toggle_float()
        end,
        desc = 'Toggle Oil file browser',
      },
    },
  },
}
