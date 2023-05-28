return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			on_highlights = function(hl, c)
				local darker_bg = require("tokyonight.util").darken(c.bg_dark, 0.4)
				hl.TelescopeTitle = {
					bg = c.magenta,
					fg = c.bg,
				}
				hl.TelescopeSelection = {
					bg = c.bg_highlight,
				}
				hl.TelescopeNormal = {
					bg = c.bg_dark,
					fg = c.fg,
				}
				hl.TelescopeBorder = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopePromptTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopePromptCounter = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopeResultsBorder = {
					bg = darker_bg,
					fg = darker_bg,
				}
				hl.TelescopeResultsNormal = {
					bg = darker_bg,
					fg = c.fg,
				}
			end,
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}
