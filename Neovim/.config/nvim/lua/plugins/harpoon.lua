return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
  init = function()
    require("utils.map").load_mapping("harpoon")
  end,
  enabled = true,
	-- event = "VeryLazy",
	-- lazy = false,
  -- keys = function() return require("utils.map").load_mapping("harpoon") end,
}
