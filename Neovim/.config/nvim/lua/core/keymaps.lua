local M = {}
--- Someone find how to break this setup, including dumb ways (I want to idiot proof this)
M.abc = {
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
        ['zv'] = { '<CMD>set foldmethod=marker<CR>', 'Update Folds'}
    },
    v = {
        ['<space>'] = { '<NOP>', 'Remove Space mapping' },
        ['<C-c>'] = { '<Esc>', '' },
    },
    i = {
        ['<C-c>'] = { '<Esc>', '' },
    },
}

M.flash = {
    n = {
        ['s'] = {
            function()
                require('flash').jump()
            end,
            'Flash',
        },
        ['S'] = {
            function()
                require('flash').treesitter()
            end,
            'Flash Treesitter',
        },
    },
    v = {
        ['s'] = {
            function()
                require('flash').jump()
            end,
            'Flash',
        },
        ['S'] = {
            function()
                require('flash').treesitter()
            end,
            'Flash Treesitter',
        },
    },
    o = {
        ['s'] = {
            function()
                require('flash').jump()
            end,
            'Flash',
        },
        ['S'] = {
            function()
                require('flash').treesitter()
            end,
            'Flash Treesitter',
        },
        ['r'] = {
            function()
                require('flash').remote()
            end,
            'Flash Remote',
        },
    },
}

M.trouble = {
    n = {
        ['<leader>wd'] = {
            '<CMD>TroubleToggle workspace_diagnostics<CR>',
            'Diagnostics',
        },
        ['<leader>bd'] = {
            '<CMD>TroubleToggle document_diagnostics<CR>',
            'Diagnostics',
        },
    },
}

M.spectre = {
    n = {
        ['<leader>wS'] = {
            function()
                require('spectre').open()
            end,
            'Find & Replace',
        },
        ['<leader>bS'] = {
            function()
                require('spectre').open_file_search { select_word = true }
            end,
            'Find and Replace',
        },
    },
}

M.harpoon = {
    n = {
        ['<leader>am'] = {
            function()
                require('harpoon.mark').add_file()
            end,
            'Mark',
        },

        ['<leader>om'] = {
            function()
                require('harpoon.ui').toggle_quick_menu()
            end,
            'Marks',
        },
        ['<M-j>'] = {
            function()
                require('harpoon.ui').nav_file(1)
            end,
            'Goto mark 1',
        },
        ['<M-k>'] = {
            function()
                require('harpoon.ui').nav_file(2)
            end,
            'Goto mark 2',
        },
        ['<M-l>'] = {
            function()
                require('harpoon.ui').nav_file(3)
            end,
            'Goto mark 3',
        },
        ['<M-h>'] = {
            function()
                require('harpoon.ui').nav_file(4)
            end,
            'Goto mark 4',
        },
    },
}

M.telescope = {
    n = {
        ['<C-p>'] = { '<CMD>Telescope fd<CR>', 'Search File' },
        ['<leader>ff'] = { '<CMD>Telescope fd<CR>', 'File' },
        ['<leader>ft'] = { '<CMD>Telescope<CR>', 'Telescope Builtins' },
        ['<leader>fh'] = { '<CMD>Telescope help_tags<CR>', 'Help' },
    },
}

M.lspconfig = {
    n = {
        ['<leader>ol'] = { '<CMD>LspInfo<CR>', 'Lsp Info' },
        ['<leader>om'] = { '<CMD>Mason<CR>', 'Mason' },

        ['<leader>os'] = {
            function()
                vim.lsp.buf.signature_help()
            end,
            'Signature',
        },
        ['<leader>bf'] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            'Format',
        },
        ['<leader>ld'] = { vim.diagnostic.open_float, 'Diagnostics' },
        ['K'] = { vim.lsp.buf.hover, 'Documentation Float' },
    },
}

M.lspsaga = {
    n = {
        ['<leader>si'] = { '<CMD>Lspsaga lsp_finder<CR>', 'Info' },
        ['<leader>sr'] = { '<CMD>Lspsaga rename<CR>', 'Rename' },
        ['<leader>la'] = { '<CMD>Lspsaga code_action<CR>', 'Action' },
    },
}

M.dap = {
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

M.gitsigns = {
    n = {
        ['<leader>gp'] = {
            function()
                require('gitsigns').prev_hunk()
            end,
            'Previous Hunk',
        },
        ['<leader>gn'] = {
            function()
                require('gitsigns').prev_hunk()
            end,
            'Next Hunk',
        },
        ['<leader>gs'] = {
            function()
                require('gitsigns').preview_hunk()
            end,
            'Preview Hunk',
        },
    },
}

M.fzf_lua = {
    n = {
        ['<C-p>'] = {
            function()
                require('fzf-lua').files()
            end,
            'Search Files',
        },
        -- ['<C-q>'] = {
        --   function()
        --     require('fzf-lua').buffers()
        --   end,
        --   'Switch Buffers',
        -- },
    },
}

M.java = {
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

return M
