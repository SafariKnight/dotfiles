-- If the keybinds ever feel confusing to you
-- Then remember that I use Colemak-DH
vim.loader.enable()
---@diagnostic disable-next-line: lowercase-global
map = vim.keymap.set
require("core.options")
require("core.keymaps")
require("core.lazy")
-- require("core.autocmds") -- Contains nothing right now
