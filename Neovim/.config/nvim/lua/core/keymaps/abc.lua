return {
    n = {
        ['<space>'] = { '<NOP>', 'Remove Space mapping' },

        -- Center after actions
        ['<C-d>'] = { '<C-d>zz', 'Down half a page' },
        ['<C-u>'] = { '<C-u>zz', 'Up half a page' },
        ['n'] = { 'nzz', 'Next result (Center)' },
        ['N'] = { 'Nzz', 'Prev result (Center)' },

        ['J'] = { "maJ'a", 'Append next line on current line' },

        -- Better J and K (With wrapping)
        ['k'] = { "v:count == 0 ? 'gk' : 'k'", 'Up', opts = { expr = true } },
        ['j'] = { "v:count == 0 ? 'gj' : 'j'", 'Down', opts = { expr = true } },

        ['<C-c>'] = { '<Esc>', '' },
        ['<leader><leader>'] = { '<CMD>wa<CR><C-z>', 'Minimize' },
        ['zv'] = { '<CMD>set foldmethod=marker<CR>', 'Update Folds' },
    },
    v = {
        ['<space>'] = { '<NOP>', 'Remove Space mapping' },
        ['<C-c>'] = { '<Esc>', '' },
    },
    i = {
        ['<C-c>'] = { '<Esc>', '' },
    },
}
