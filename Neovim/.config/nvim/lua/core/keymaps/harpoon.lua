return {
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
        ['<C-j>'] = {
            function()
                require('harpoon.ui').nav_file(1)
            end,
            'Goto mark 1',
        },
        ['<C-k>'] = {
            function()
                require('harpoon.ui').nav_file(2)
            end,
            'Goto mark 2',
        },
        ['<C-l>'] = {
            function()
                require('harpoon.ui').nav_file(3)
            end,
            'Goto mark 3',
        },
        ['<C-h>'] = {
            function()
                require('harpoon.ui').nav_file(4)
            end,
            'Goto mark 4',
        },
    },
}
