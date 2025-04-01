---@diagnostic disable: missing-fields
-- Improved default mappings
vim.keymap.set("n", "J", "maJ'a", { desc = "Append next line on current line" })
vim.keymap.set(
  "n",
  "k",
  "v:count == 0 ? 'gk' : 'k'",
  { desc = "Up", expr = true }
)
vim.keymap.set(
  "n",
  "j",
  "v:count == 0 ? 'gj' : 'j'",
  { desc = "Down", expr = true }
)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Down" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Up" })

vim.keymap.set("n", "<leader>h", "<CMD>tabprev<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>l", "<CMD>tabnext<CR>", { desc = "Next Tab" })
