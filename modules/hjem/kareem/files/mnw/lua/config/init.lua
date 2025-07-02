local req = function(path)
  require("config." .. path)
end

-- Before everything
-- vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

req("options")
