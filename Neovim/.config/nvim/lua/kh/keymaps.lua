-- Centered Actions
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Down half a page" })
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Up   half a page" })
-- vim.keymap.set("n", "n", "nzz", { desc = "Next result" })
-- vim.keymap.set("n", "N", "Nzz", { desc = "Previous result" })

-- Improved default mappings
vim.keymap.set("n", "J", "maJ'a", { desc = "Append next line on current line" })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true })


vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Down" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Up" })
