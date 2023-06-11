return function()
  local wk = require('which-key')
  wk.setup({
    key_labels = {
      ["<space>"] = "SPC",
      ["<leader>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "",
      group = "",
    }
  })
end
