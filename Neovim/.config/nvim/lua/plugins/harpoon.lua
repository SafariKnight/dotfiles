return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- event = "VeryLazy",
	-- lazy = false,
  keys = function() return require("utils.map").load_mapping("harpoon") end,
}
