return {
    {
        'nvim-telescope/telescope.nvim',
        cmd = { 'Telescope' },
        -- enabled = false,
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        init = function()
            require 'core.map' 'telescope'
        end,
        config = function()
            local actions = require 'telescope.actions'
            local telescope = require 'telescope'
            telescope.setup {
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = 'smart_case',
                    },
                },
                defaults = {
                    prompt_prefix = '  ',
                    entry_prefix = '  ',
                    selection_caret = '  ',
                    layout_strategy = 'horizontal',
                    layout_config = {
                        horizontal = {
                            height = 0.66,
                        },
                    },
                },
                pickers = {
                    buffers = {
                        mappings = {
                            i = {
                                ['<C-d>'] = actions.delete_buffer
                                    + actions.move_to_top,
                            },
                        },
                    },
                },
            }
            telescope.load_extension 'fzf'
        end,
    },
}
