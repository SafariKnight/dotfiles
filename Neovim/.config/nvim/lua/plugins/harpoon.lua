return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	lazy = false,
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local marked_files = {}
		for idx = 1, mark.get_length() do
			local file = mark.get_marked_file_name(idx)
			if file == "" then
				file = "(empty)"
			end
			marked_files[idx] = string.format("%s", file)
		end
		local function get_entry(idx)
			local file_name = marked_files[idx] or idx .. " (Unset)"
			return "Goto file " .. file_name
		end
		local file1 = get_entry(1)
		local file2 = get_entry(2)
		local file3 = get_entry(3)
		local file4 = get_entry(4)
		local nmap = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { desc = desc, silent = true, noremap = true })
		end
		nmap("<leader>hp", mark.add_file, "Add Mark")
		nmap("<leader>hu", ui.toggle_quick_menu, "Open UI")
		nmap("<C-j>", function()
			ui.nav_file(1)
		end, file1)
		nmap("<C-k>", function()
			ui.nav_file(2)
		end, file2)
		nmap("<C-l>", function()
			ui.nav_file(3)
		end, file3)
		nmap("<C-h>", function()
			ui.nav_file(4)
		end, file4)
		nmap("<leader>hj", function()
			ui.nav_file(1)
		end, file1)
		nmap("<leader>hk", function()
			ui.nav_file(2)
		end, file2)
		nmap("<leader>hl", function()
			ui.nav_file(3)
		end, file3)
		nmap("<leader>hh", function()
			ui.nav_file(4)
		end, file4)
	end,
}
