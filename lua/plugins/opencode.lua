return {
  -- Opencode plugin
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { 'folke/snacks.nvim' },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      vim.keymap.set({ 'n', 'x' }, '<leader>oa', function()
        require('opencode').ask('@this: ', { submit = true })
      end, { desc = 'Opencode [A]sk' })
      vim.keymap.set({ 'n', 'x' }, '<leader>ox', function()
        require('opencode').select()
      end, { desc = 'Opencode e[X]ecute action' })
      vim.keymap.set({ 'n', 't' }, '<leader>ot', function()
        require('opencode').toggle()
      end, { desc = 'Opencode [T]oggle' })

      vim.keymap.set({ 'n', 'x' }, 'go', function()
        return require('opencode').operator '@this '
      end, { expr = true, desc = 'Add range to opencode' })
      vim.keymap.set('n', 'goo', function()
        return require('opencode').operator '@this ' .. '_'
      end, { expr = true, desc = 'Add line to opencode' })

      vim.keymap.set({ 'n', 't' }, '<S-C-Up>', function()
        require('opencode').command 'session.half.page.up'
      end, { desc = 'Opencode half page up' })
      vim.keymap.set({ 'n', 't' }, '<S-C-Down>', function()
        require('opencode').command 'session.half.page.down'
      end, { desc = 'Opencode half page down' })
    end,
  },
}
