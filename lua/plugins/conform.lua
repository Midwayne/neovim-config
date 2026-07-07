return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disabled_filetypes = { asm = true }
        if disabled_filetypes[vim.bo[bufnr].filetype] then
          return nil
        end

        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end,
      formatters_by_ft = {
        asm = {},
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        go = { 'goimports', 'gofmt', stop_after_first = true },
        java = { 'google_java_format' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        kotlin = { 'ktlint' },
        lua = { 'stylua' },
        python = { 'ruff_format' },
        rust = { 'rustfmt' },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        tsx = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },
}
