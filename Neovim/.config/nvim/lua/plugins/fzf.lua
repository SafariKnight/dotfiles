return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  enabled = false,
  keys = {
    {"<leader>ff", function () require("fzf-lua").files() end, desc = "Search Files"},
    {"<leader>fg", function () require("fzf-lua").buffers() end, desc = "Switch Buffers"},
  },
  config = function ()
    local fzf = require('fzf-lua')
    fzf.setup('fzf-native')
    fzf.register_ui_select()
  end
}

