return {
  "rgroli/other.nvim",
  config = function()
    require("other-nvim").setup({
      mappings = {
        {
          pattern = ".*/(.*).html$",
          target = {
            -- { target = "styles/%1.css", context = "styles" },
            { target = "assets/styles/%1.css", context = "styles" },
          },
        },
        -- {
        --   pattern = "styles/(.*).css",
        --   target = "%1.html",
        --   context = "document",
        -- },
        {
          pattern = "assets/styles/(.*).css",
          target = "%1.html",
          context = "document",
        },
      },
    })
  end,
  cmd = { "Other", "OtherTabNew", "OtherSplit", "OtherVSplit" },
  keys = {
    { "<A-y>", "<CMD>Other<CR>", desc = "Open Other File" },
  },
}
