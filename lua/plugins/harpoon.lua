return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup {}

        local conf = require('telescope.config').values

        local function toggle_telescope(harpoon_files)
            local finder = function()
                local paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(paths, item.value)
                end

                return require('telescope.finders').new_table {
                    results = paths,
                }
            end

            require('telescope.pickers')
                .new({}, {
                    prompt_title = 'Harpoon',
                    finder = finder(),
                    previewer = conf.file_previewer {},
                    sorter = conf.generic_sorter {},
                    layout_config = {
                        height = 0.9,
                        width = 0.9,
                        prompt_position = 'top',
                        preview_cutoff = 120,
                    },
                    attach_mappings = function(prompt_bufnr, map)
                        map('i', '<C-d>', function()
                            local state = require 'telescope.actions.state'
                            local selected_entry = state.get_selected_entry()
                            local current_picker = state.get_current_picker(prompt_bufnr)

                            table.remove(harpoon_files.items, selected_entry.index)
                            current_picker:refresh(finder())
                        end)
                        return true
                    end,
                })
                :find()
        end

        vim.keymap.set('n', '<leader>He', function()
            toggle_telescope(harpoon:list())
        end, { desc = 'Harpoon open window' })

        vim.keymap.set('n', '<leader>Ha', function()
            harpoon:list():add()
        end, { desc = 'Harpoon [A]dd file' })

        for i = 1, 4 do
            vim.keymap.set('n', '<leader>H' .. i, function()
                harpoon:list():select(i)
            end, { desc = 'Harpoon select ' .. i })
        end

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set('n', '<C-S-P>', function()
            harpoon:list():prev()
        end, { desc = 'Harpoon previous' })
        vim.keymap.set('n', '<C-S-N>', function()
            harpoon:list():next()
        end, { desc = 'Harpoon next' })
    end,
}
