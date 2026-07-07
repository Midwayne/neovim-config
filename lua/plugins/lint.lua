return {
    { -- Linting
        'mfussenegger/nvim-lint',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local lint = require 'lint'
            lint.linters_by_ft = {
                c = { 'cpplint' },
                cpp = { 'cpplint' },
                go = { 'golangcilint' },
                javascript = { 'eslint_d' },
                kotlin = { 'ktlint' },
                markdown = { 'markdownlint' },
                python = { 'ruff' },
                rust = { 'clippy' },
                typescript = { 'eslint_d' },
                tsx = { 'eslint_d' },
            }

            local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
            vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
                group = lint_augroup,
                callback = function()
                    if vim.bo.modifiable then
                        lint.try_lint()
                    end
                end,
            })
        end,
    },
}
