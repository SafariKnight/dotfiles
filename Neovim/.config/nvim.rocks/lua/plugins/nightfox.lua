-- Needed to vim.schedule because it breaks if I don't
vim.schedule(function()
  require("nightfox").setup({})
  vim.cmd.colorscheme("carbonfox")
end)
