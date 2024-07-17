return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Completion sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    -- Snippet Engine
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          return require("luasnip").lsp_expand(args.body)
        end,
      },
      --      window = {
      --        completion = cmp.config.window.bordered(),
      --        documentation = cmp.config.window.bordered(),
      --      },

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          local kind_icons = require("kh.icons").kind
          -- Kind icons
          item.kind = kind_icons[item.kind]
          -- Source
          item.menu = ({
            buffer = "Buffer",
            nvim_lsp = "LSP",
            luasnip = "Snippet",
          })[entry.source.name]
          return item
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete({}),
        -- behavior = cmp.ConfirmBehavior.Replace,
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = {
        { name = "nvim_lsp", group_index = 1 },
        { name = "luasnip",  group_index = 1 },
        { name = "buffer",   group_index = 2 },
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "path",    group_index = 1 },
        { name = "cmdline", group_index = 2 },
      },
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end,
}
