return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  enabled = false,
  cmd = { "Telescope" },

  keys = function()
    local ts = require("telescope.builtin")
    return {
      --stylua: ignore
      { "<leader><space>", "<CMD>Telescope frecency workspace=CWD<CR>", desc = "Find file (Frecency CWD)" },
      {
        "<leader>ff",
        function()
          ts.fd()
        end,
        desc = "File",
      },
      {
        "<leader>fb",
        function()
          ts.buffers()
        end,
        desc = "Buffer",
      },
      {
        "<leader>ft",
        function()
          ts.live_grep()
        end,
        desc = "Text",
      },
      {
        "<leader>fh",
        function()
          ts.help_tags()
        end,
        desc = "Help",
      },
    }
  end,

  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-frecency.nvim",
  },

  opts = {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      },
    },
    addons = {
      "fzf",
      "ui-select",
      "frecency",
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    for _, addon in ipairs(opts.addons) do
      require("telescope").load_extension(addon)
    end
  end,
}
