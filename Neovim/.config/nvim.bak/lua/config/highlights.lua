local colors = require("catppuccin.palettes").get_palette("mocha")
local set_hl = vim.api.nvim_set_hl
set_hl(0, "TelescopeNormal", { bg = colors.mantle, fg = colors.text })
set_hl(0, "TelescopeBorder", { bg = colors.mantle, fg = colors.mantle })
set_hl(0, "TelescopeTitle", { bg = colors.flamingo, fg = colors.base })
set_hl(0, "TelescopeResultsNormal", { bg = colors.crust, fg = colors.text })
set_hl(0, "TelescopeResultsBorder", { bg = colors.crust, fg = colors.crust })
set_hl(0, "TelescopePromptCounter", { bg = colors.mantle, fg = colors.mantle })
