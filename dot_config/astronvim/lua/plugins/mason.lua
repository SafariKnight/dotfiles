---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- lsp
        "lua-language-server",
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "some-sass-language-server",

        -- formatters
        "stylua",

        -- debuggers
        "debugpy",
      },
    },
  },
}
