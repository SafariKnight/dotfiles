---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = {
      pwd_on_enter = {
        {
          event = { "VimEnter" },
          callback = function()
            vim.schedule(function()
              print(os.getenv "PWD")
              vim.cmd.cd(os.getenv "PWD")
            end)
          end,
        },
      },
    },
    mappings = {
      n = {
        ["<Leader><space>"] = { function() require("snacks").picker.files() end, desc = "Find Files" },

        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Disable Mappings
        ["<Leader>/"] = false,
        ["<Leader>w"] = false,
        ["<Leader>R"] = false,
        ["<Leader>h"] = false,
        ["<Leader>n"] = false,
        ["<Leader>q"] = false,
        ["<Leader>Q"] = false,
      },
    },
  },
}
