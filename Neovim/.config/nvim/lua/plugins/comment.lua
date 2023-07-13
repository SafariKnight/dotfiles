return {
    'numToStr/Comment.nvim',
    lazy = true,
    keys = {
        { 'gc', mode = { 'n', 'v', 'o' }, desc = 'Comment Selection' },
        { 'gb', mode = { 'n', 'v', 'o' }, desc = 'Comment Block' },
    },
    opts = function()
        local prehook = require(
            'ts_context_commentstring.integrations.comment_nvim'
        ).create_pre_hook()
        return {
            pre_hook = prehook,
        }
    end,
}
