local opts = {
  ai = {},
  comment = {},
  pairs = {},
  icons = {},
  sessions = {
    autoread = false, -- Enter via snacks dashboard
    autowrite = true,
    directory = "~/.vim/sessions",
    file = "",
  },
  -- surround = {
  --   mappings = {
  --     add = "gza",
  --   },
  -- },
}

return {
  "mini.nvim",
  lazy = false,
  after = function()
    for module, options in pairs(opts) do
      require("mini." .. module).setup(options)
      if module == "sessions" then
        vim.api.nvim_create_user_command("Mksession", function()
          local dir, _ = string.gsub(vim.fn.getcwd(), "/", "%%")
          MiniSessions.write(dir, { verbose = false })
        end, {})

        vim.api.nvim_create_user_command("Delsession", function()
          local dir, _ = string.gsub(vim.fn.getcwd(), "/", "%%")
          MiniSessions.delete(dir, { force = true, verbose = false })
        end, {})
      end
    end
    MiniIcons.mock_nvim_web_devicons()
  end,
}
