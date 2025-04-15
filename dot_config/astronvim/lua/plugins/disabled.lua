local disabled = {
  -- "nvim-neo-tree/neo-tree.nvim",
  "akinsho/toggleterm.nvim",
}

return vim.tbl_map(function(plugin) return { plugin, enabled = false } end, disabled)
