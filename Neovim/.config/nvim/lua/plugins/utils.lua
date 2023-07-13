return {
    -- Detect tabstop and shiftwidth automatically
    -- Note to self, never disable this
    { 'tpope/vim-sleuth', lazy = false },

    -- Dispatch is just nice okay?
    -- Although I might remove it now that I know about <C-z> and `fg`
    { 'tpope/vim-dispatch', lazy = false },
    {
        'nvim-pack/nvim-spectre',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        init = function()
            require 'core.map' 'spectre'
        end,
        cmd = { 'Spectre' },
    },
    {
        'mbbill/undotree',
        cmd = { 'UndotreeToggle' },
        init = function()
            keybind['<leader>ou'] = { vim.cmd.UndotreeToggle, 'Undotree' }
        end,
    },
}
