return {
  "blink.cmp",
  event = "InsertEnter",
  after = function()
    require("blink.cmp").setup({
      fuzzy = {
        sorts = {
          function(a, b)
            if
              (a.client_name == nil or b.client_name == nil)
              or (a.client_name == b.client_name)
            then
              return
            end
            return b.client_name == "emmet_language_server"
          end,
          "score",
          "sort_text",
        },
      },
      completion = {
        accept = {
          dot_repeat = false,
        },
        trigger = {
          show_on_blocked_trigger_characters = {
            " ",
            "@",
            "\n",
            "\t",
            "$",
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
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
      },
      signature = { enabled = true },

      sources = {
        default = {
          "lazydev",
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    })
  end,
}
