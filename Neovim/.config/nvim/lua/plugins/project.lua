return {
    'ahmedkhalf/project.nvim',
    opts = {

        patterns = {
            '.git',
            '_darcs',
            '.hg',
            '.bzr',
            '.svn',
            'Makefile',
            'package.json',
            'settings.gradle',
        },
    },
    event = 'VeryLazy',
    init = function()
        keybind['<leader>fp'] = { '<CMD>Telescope projects<CR>', 'Projects' }
    end,
    config = function(_, opts)
        require('project_nvim').setup(opts)
        require('telescope').load_extension 'projects'
    end,
}
