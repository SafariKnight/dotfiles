return {
  "echasnovski/mini.nvim",
  version = false,
  lazy = false,
  priority = 1000,
  opts = {
    ai = {},
    comment = {},
    -- pairs = {},
    icons = {},
    snippets = {},
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
  },
  config = function(_, opts)
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
  end,
}
