return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      animate = { enabled = true },
      bigfile = { enabled = true },
      dim = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      image = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          ---@diagnostic disable-next-line: duplicate-set-field
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          ---@diagnostic disable-next-line: duplicate-set-field
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd
        end,
      })
    end,
    keys = {
      {
        "<leader><space>",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.files()
        end,
        desc = "Files",
      },
      {
        "<leader>fs",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart Files",
      },
      {
        "<leader>fM",
        function()
          Snacks.explorer()
        end,
        desc = "File Tree",
      },
      {
        "<leader>ft",
        function()
          Snacks.picker.grep()
        end,
        desc = "Text",
      },
      {
        "<leader>fu",
        function()
          Snacks.picker.undo()
        end,
        desc = "Undo",
      },
      {
        "<leader>F",
        function()
          if _G.snacksDim then
            Snacks.dim.disable()
            _G.snacksDim = false
          else
            Snacks.dim()
            _G.snacksDim = true
          end
        end,
        desc = "Focus",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>f", group = "find" },
      },
    },
  },
}
