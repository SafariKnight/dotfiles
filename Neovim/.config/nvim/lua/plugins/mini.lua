---@type LazySpec
return {
    'echasnovski/mini.nvim',
    version = false,
    lazy = false,
    -- event = 'VeryLazy',
    init = function()
        vim.g.loaded_netrw = 1 -- Go away netrw
        vim.g.loaded_netrwPlugin = 1
    end,
    -- dependencies = {
    --     'nvim-tree/nvim-web-devicons',
    -- },
    opts = {
        surround = {
            mappings = {
                add = 'gza', -- Add surrounding in Normal and Visual modes
                delete = 'gzd', -- Delete surrounding
                replace = 'gzr', -- Replace surrounding

                find = '', -- Find surrounding (to the right)
                find_left = '', -- Find surrounding (to the left)
                highlight = '', -- Highlight surrounding
                update_n_lines = '', -- Update `n_lines`
                suffix_last = '', -- Suffix to search with "prev" method
                suffix_next = '', -- Suffix to search with "next" method
            },
        },
    },
    config = function(_, opts)
        local activate = function(module) -- The only function I've done well ever
            require('mini.' .. module).setup(opts[module])
        end

        activate 'ai'
        activate 'comment'
        activate 'surround'
    end,
}
