return {
    n = {
        ['<F2>'] = { '<CMD>DapStepOver<CR>', 'Over' },
        ['<F3>'] = { '<CMD>DapStepOut<CR>', 'Out' },
        ['<F4>'] = { '<CMD>DapStepInto<CR>', 'Into' },
        ['<F5>'] = { '<CMD>DapContinue<CR>', 'Continue' },
        ['<leader>od'] = {
            function()
                require('dapui').toggle()
            end,
            'Toggle UI',
        },
        ['<leader>lb'] = { '<CMD>DapToggleBreakpoint<CR>', 'Toggle Breakpoint' },
    },
}
