return {
  {
    'dmtrKovalenko/fff',
    build = function()
      require('fff.download').download_or_build_binary()
    end,
    lazy = false,
    config = function()
      local function live_grep_open_files()
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
      end

      vim.keymap.set('n', '<leader>sg', function()
        require('fff').live_grep()
      end, { desc = '[S]earch by [G]rep' })

      vim.keymap.set({ 'n', 'x' }, '<leader>sw', function()
        require('fff').live_grep_under_cursor()
      end, { desc = '[S]earch current [W]ord' })

      vim.keymap.set('n', '<leader>s/', live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
    end,
  },
}
