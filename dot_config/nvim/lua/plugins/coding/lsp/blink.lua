return {
  {
    "saghen/blink.cmp",
    lazy = false,
    version = "*",

    ---@type blink.cmp.Config
    opts = {
      keymap = {
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
      },
      completion = {
        keyword = { range = "prefix" },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = true,
        },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },
    },
    opts_extend = {
      "sources.default",
    },
  },
}
