return {
  "snacks.nvim",
  lazy = false,
  keys = {
    {
      "<leader>f",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Find Text",
    },
    {
      "<leader>t",
      function()
        Snacks.explorer.open()
      end,
      desc = "File Tree",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help",
    },
  },
  after = function()
    Snacks.setup {
      animate = { enabled = true },
      bigfile = { enabled = true },
      dim = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          keys = {
            {
              icon = " ",
              key = "f",
              desc = "Find File",
              action = ":lua Snacks.dashboard.pick('files')",
            },
            {
              icon = " ",
              key = "n",
              desc = "New File",
              action = ":ene | startinsert",
            },
            {
              icon = "󰙅 ",
              key = "e",
              desc = "File Buffer",
              action = ":Oil",
            },
            {
              icon = " ",
              key = "/",
              desc = "Find Text",
              action = ":lua Snacks.dashboard.pick('live_grep')",
            },
            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            {
              icon = " ",
              key = "q",
              desc = "Quit",
              action = ":qa",
            },
          },
        },
        sections = {
          { section = "header" },
          {
            section = "keys",
            gap = 1,
            padding = 1,
          },
        },
      },
      explorer = {
        enabled = true,
        replace_netrw = false,
      },
      image = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    }
  end,
}
