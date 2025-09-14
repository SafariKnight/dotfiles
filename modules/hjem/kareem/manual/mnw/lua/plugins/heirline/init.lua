---@diagnostic disable: missing-fields
return {
  "heirline.nvim",
  event = "DeferredUIEnter",
  after = function()
    local StatusLine = require("plugins.heirline.statusline")
    require("heirline").setup {
      statusline = StatusLine,
    }
  end,
}
