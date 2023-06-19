_G.set_colors = function(colorscheme)
  -- vim.o.termguicolors = true
  colorscheme = colorscheme or 'rose-pine'
  vim.cmd.colorscheme(colorscheme)
end
