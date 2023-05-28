return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ "catppuccin/nvim", name = "catppuccin" },
	},
	cmd = "FzfLua",
	enabled = false,
	init = function()
		require("utils.map").load_mapping("fzf_lua")
		-- vim.ui.select = function(...)
		-- 	require("lazy").load({ plugins = { "fzf-lua" } })
		-- 	return vim.ui.select(...)
		-- end
	end,
	config = function()
		local fzf = require("fzf-lua")
		local colors = require("catppuccin.palettes").get_palette("mocha")
		fzf.setup({
			"fzf_native",
			fzf_opts = {
				["--layout"] = "reverse",
				["--info"] = "hidden",
			},
			fzf_colors = {
				["gutter"] = colors.base,
				["pointer"] = colors.surface0,
				["marker"] = colors.red,
				["prompt"] = colors.lavender,
				["info"] = colors.yellow,
				["hl"] = colors.teal,
				["hl+"] = colors.green,
				["bg"] = colors.base,
				["bg+"] = colors.surface0,
				["fg"] = colors.text,
				["fg+"] = colors.subtext1,
			},
			winopts = {
				preview = {
					default = "bat",
					border = "border-bottom",
					layout = "vertical",
					vertical = "up",
				},
			},
			files = {
				prompt = "   > ",
			},
			buffers = {
				prompt = "   > ",
			},
			lsp_code_actions = {
				prompt = "   > ",
				winopts = {
					height = 0.33,
					width = 0.1,
				},
			},
		})
		fzf.register_ui_select()
	end,
}
