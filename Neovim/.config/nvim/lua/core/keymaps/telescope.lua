return {
    n = {
        ['<C-n>'] = { '<CMD>Telescope fd<CR>', 'Search File' },
        ['<leader>ff'] = { '<CMD>Telescope fd<CR>', 'File' },
        ['<leader>ft'] = { '<CMD>Telescope<CR>', 'Telescope Builtins' },
        ['<leader>fh'] = { '<CMD>Telescope help_tags<CR>', 'Help' },

        -- Very bad idea
        -- [':'] = {'<CMD>Telescope commands<CR>', 'Commands'},
    },
}
