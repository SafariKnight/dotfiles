return {
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
