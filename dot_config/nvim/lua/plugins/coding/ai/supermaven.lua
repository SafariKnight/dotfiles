return {
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      keymaps = {
        accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
      },
      disable_inline_completion = true,
      ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
    },
    keys = {
      { "<leader>ase", "<CMD>SupermavenStop<CR>", desc = "End" },
      { "<leader>asr", "<CMD>SupermavenRestart<CR>", desc = "Restart" },
      { "<leader>ass", "<CMD>SupermavenStart<CR>", desc = "Start" },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "supermaven-inc/supermaven-nvim",
    },
    opts = {
      keymap = {
        ["<C-e>"] = {
          function()
            local suggestion = require("supermaven-nvim.completion_preview")
            if suggestion.has_suggestion() then
              vim.schedule(function()
                suggestion.on_accept_suggestion()
              end)
              return true
            end
          end,
          "fallback",
        },
      },
      completion = {
        menu = {
          draw = {
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  if ctx.source_id == "supermaven" then
                    return ""
                  end
                  return ctx.kind_icon .. ctx.icon_gap
                end,
              },
            },
          },
        },
      },
      sources = {
        default = {
          "supermaven",
        },
        providers = {
          supermaven = {
            name = "supermaven",
            module = "blink.compat.source",
            score_offset = 100,
            timeout_ms = 2000,
            async = true,
          },
        },
      },
    },
  },
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
    opts = {},
  },
}
