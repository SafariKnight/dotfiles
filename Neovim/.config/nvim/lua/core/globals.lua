_G.set_colors = function(colorscheme)
  -- vim.o.termguicolors = true
  colorscheme = colorscheme or 'sonokai'
  vim.cmd.colorscheme(colorscheme)
end

_G.keybind = {
  mode = 'n',
  added_opts = {},
}

setmetatable(keybind, {
  __newindex = function(t, k, keybinds)
    local rhs = keybinds[1]
    local opts = vim.tbl_deep_extend(
      'force',
      { silent = true, noremap = true, desc = keybinds[2] },
      keybinds.opts or {}
    )
    opts = vim.tbl_deep_extend('force', opts, t.added_opts or {})
    vim.keymap.set(t.mode, k, rhs, opts)
  end,
})
