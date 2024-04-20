local ts = require("telescope")
local opts = {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  },
  addons = {
    "fzf",
    "ui-select",
    "frecency",
  }
}

ts.setup(opts)
for _, addon in ipairs(opts.addons) do
  ts.load_extension(addon)
end

local ts = require("telescope.builtin")
map("n", "<leader><space>", "<CMD>Telescope frecency workspace=CWD<CR>", { desc = "Find file (Frecency CWD)"})
map("n", "<leader>ff", function() ts.fd() end, { desc = "file"} )
map("n", "<leader>fb", function() ts.buffers() end, { desc = "buffer"} )
map("n", "<leader>fh", function() ts.help_tags() end, { desc = "help"} )
