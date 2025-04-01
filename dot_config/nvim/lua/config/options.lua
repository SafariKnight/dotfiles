-- better searching
vim.o.hlsearch = false
vim.o.incsearch = true

-- preview substitutions live, as you type!
vim.o.inccommand = "split"

-- make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- disable mouse
vim.o.mouse = ""

vim.o.clipboard = "unnamedplus"

vim.o.swapfile = false
vim.o.backup = false

-- save undo history
vim.o.undofile = true
if vim.fn.has("linux") == 1 then
  vim.o.undodir = vim.fn.expand("~/.vim/undodir")
elseif vim.fn.has("windows") == 1 then
  vim.o.undodir = vim.fn.expand("$localappdata") .. "\\.vim\\undodir"
end

-- -- enable break indent
vim.o.breakindent = true
--
-- -- do your best neovim please
vim.o.smartindent = true

-- should've changed this so long ago
vim.o.wrap = false

-- case insensitive searching unless /c or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- decrease update time
vim.o.updatetime = 50
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.termguicolors = true

-- hey this is pretty cool
vim.o.scrolloff = 9999

-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- sets how neovim will display certain whitespace characters in the editor.
-- `:help 'list'`
-- `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  -- multispace = "·",
  trail = "·",
  nbsp = "␣",
}

-- show which line your cursos is on
vim.opt.cursorline = false

-- 300 (default) is so short man
vim.o.timeout = true
vim.o.timeoutlen = 800

-- Fold stuff
vim.o.foldmethod = "marker"

-- Turn off mode
vim.o.showmode = false

-- REMOVE EVERYTHING
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.ruler = false
