local autocmd = vim.api.nvim_create_autocmd
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Remember folds and cursor
-- local function remember(mode)
-- 	-- stylua: ignore
-- 	local ignoredFts = { "TelescopePrompt", "DressingSelect", "DressingInput", "toggleterm", "gitcommit", "replacer", "harpoon", "help", "qf" }
-- 	if vim.tbl_contains(ignoredFts, vim.bo.filetype) or vim.bo.buftype ~= "" or not vim.bo.modifiable then return end
--
-- 	if mode == "save" then
-- 		cmd.mkview(1)
-- 	else
-- 		pcall(function() cmd.loadview(1) end) -- pcall, since new files have no view yet
-- 	end
-- end
-- autocmd("BufWinLeave", {
-- 	pattern = "?*", -- pattern required, otherwise does not trigger
-- 	callback = function() remember("save") end,
-- })
-- autocmd("BufWinEnter", {
-- 	pattern = "?*",
-- 	callback = function() remember("load") end,
-- })
