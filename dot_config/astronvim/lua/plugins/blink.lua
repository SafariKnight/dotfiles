---@type LazySpec
return {
  "saghen/blink.cmp",
  ---@type blink.cmp.config
  opts = {
    keymap = {
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
    },
    completion = {
      menu = {
        border = "none",
      },
      documentation = {
        window = {
          border = "none",
        },
      },
    },
  },
}
