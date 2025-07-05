function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require("oil").get_current_dir(bufnr)
  if dir then
    local relativeDir = vim.fn.fnamemodify(dir, ":~:.")
    if relativeDir == vim.fn.fnamemodify(dir, ":~") then
      return vim.fn.fnamemodify(dir, ":~")
    end
    return "./" .. relativeDir
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

return {
  "oil.nvim",
  cmd = "Oil",
  lazy = false, -- because of `default_file_explorer = true`
  keys = {
    { "<leader>e", "<CMD>Oil<CR>", desc = "File Buffer" },
  },
  after = function()
    require("oil").setup {
      default_file_explorer = true,
      watch_for_changes = true,
      win_options = {
        winbar = "%!v:lua.get_oil_winbar()",
      },
    }
  end,
}
