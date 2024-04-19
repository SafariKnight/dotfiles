-- Centered Actions
map("n", "<C-d>", "<C-d>zz", { desc = "Down half a page" })
map("n", "<C-u>", "<C-u>zz", { desc = "Up   half a page" })
map("n", "n", "nzz", { desc = "Next result" })
map("n", "N", "Nzz", { desc = "Previous result" })

-- Improved default mappings
map("n", "J", "maJ'a", { desc = "Append next line on current line" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true })


map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Down" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Up" })
