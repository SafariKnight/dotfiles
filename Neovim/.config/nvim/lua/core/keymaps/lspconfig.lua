return {
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
        ['<leader>la'] = { vim.lsp.buf.code_action, 'Action' },
        ['<leader>sr'] = { vim.lsp.buf.rename, 'Rename' },
        ['gd'] = { vim.lsp.buf.definition, 'Definition' },
        ['gr'] = { '<CMD>Telescope lsp_references<CR>', 'References' },
        ['<leader>sf'] = {
            '<CMD>Telescope lsp_document_symbols<CR>',
            'Find',
        },

    },
    v = {
        ['<leader>sf'] = {
            function()
                require('telescope.builtin').lsp_document_symbols {
                    default_text = get_visual_selection(),
                }
            end,
            'Find',
        },
    },
}
