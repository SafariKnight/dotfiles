---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    formatting = {
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
      },
      timeout_ms = 1000, -- default format timeout
    },
  },
}
