return {
  "mfussenegger/nvim-dap",
  dependencies = { "rcarriga/nvim-dap-ui" },
  event = "VeryLazy",
  init = function()
    require("utils.map").load_mapping("dap")
  end,
  -- config = true
  config = function ()
    require("dapui").setup()
    local dap = require('dap')
    local mason_path = vim.fn.stdpath("data") .. "/mason/"
    local mason_bin = mason_path .. "bin/"
  end
}
