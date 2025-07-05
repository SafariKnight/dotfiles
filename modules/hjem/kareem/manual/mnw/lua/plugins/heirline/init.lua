---@diagnostic disable: missing-fields
local StatusLine = require("plugins.heirline.statusline")
return {
  "heirline.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("heirline").setup {
      statusline = StatusLine,
    }
  end,
}
