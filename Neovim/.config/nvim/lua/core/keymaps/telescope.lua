return {
    n = {
        ['<C-n>'] = { '<CMD>Telescope fd<CR>', 'Search File' },
        ['<leader>ff'] = { '<CMD>Telescope fd<CR>', 'File' },

        ['<C-s>'] = { '<CMD>Telescope grep_string<CR>', 'Search Current Word' },
        ['<leader>fw'] = { '<CMD>Telescope grep_string<CR>', 'Current Word' },

        ['<C-b>'] = { '<CMD>Telescope current_buffer_fuzzy_find<CR>', 'Find in Buffer' },
        ['<leaderfb>'] = { '<CMD>Telescope current_buffer_fuzzy_find<CR>', 'In Buffer' },

        ['<leader>ft'] = { '<CMD>Telescope<CR>', 'Telescope Builtins' },
        ['<leader>fh'] = { '<CMD>Telescope help_tags<CR>', 'Help' },

        -- Very bad idea
        -- [':'] = {'<CMD>Telescope commands<CR>', 'Commands'},
    },
}
