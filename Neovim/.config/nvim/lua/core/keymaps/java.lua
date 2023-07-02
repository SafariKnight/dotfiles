return {
    n = {
        ['<leader>jf'] = {
            function() -- could gradle generate like a few less files thank you
                require('telescope.builtin').fd {
                    find_command = {
                        'rg', -- idk how to glob search with fd
                        '--files',
                        '--glob',
                        '**/*.java',
                    },
                }
            end,
            'Find Java Files',
        },
        ['<leader>ji'] = {
            function()
                require('jdtls').organize_imports()
            end,
            'Organize Imports',
        },
        ['<leader>jv'] = {
            "<CMD>lua require('jdtls').extract_variable()<CR>",
            'Extract Variable',
        },
        ['<leader>jm'] = {
            "<CMD>lua require('jdtls').extract_method()<CR>",
            'Extract Method',
        },
    },
    v = {
        ['<leader>jv'] = {
            "<Esc><CMD>lua require('jdtls').extract_variable { true }<CR>",
            'Extract Variable',
        },

        ['<leader>jm'] = {
            "<Esc><CMD>lua require('jdtls').extract_method { true }<CR>",
            'Extract Method',
        },
    },
}
