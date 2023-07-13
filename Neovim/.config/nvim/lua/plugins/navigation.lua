return {
    -- This is actually amazing wth, screw leap lmao (that's a joke)
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        init = function()
            require 'core.map' 'flash'
        end,
        ---@type Flash.Config
        opts = {},
    },
    -- HARPOOOOOOOOOOOOOOOOOOOOOOOOON
    {
        'theprimeagen/harpoon',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        init = function()
            require 'core.map' 'harpoon'
        end,
        opts = {},
    },
}
