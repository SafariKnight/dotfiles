-- General Neovim options
vim.opt.hlsearch = false -- No highlight on search
vim.opt.incsearch = true -- Incremental search

vim.opt.inccommand = "split" -- Preview substitutions live in a split window

vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers

vim.opt.mouse = "a" -- Enable mouse support

vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard

vim.opt.swapfile = false -- Do not use swap files
vim.opt.backup = false -- Do not create backup files

vim.opt.undofile = true -- Save undo history
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Directory for undo files

vim.opt.breakindent = true -- Preserve indentation when wrapping lines

vim.opt.smartindent = true -- Smart auto-indenting

vim.opt.wrap = false -- Do not wrap lines

vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.smartcase = true -- Case-sensitive if search contains uppercase

vim.opt.signcolumn = "yes" -- Always show the sign column

vim.opt.updatetime = 50 -- Decrease update time for plugins

vim.opt.tabstop = 2 -- Number of spaces a Tab in the file counts for
vim.opt.softtabstop = 0 -- Number of spaces a Tab counts for while editing
vim.opt.shiftwidth = 2 -- Number of spaces for indenting
vim.opt.expandtab = true -- Use spaces instead of tabs

vim.opt.termguicolors = true -- Enable true color support in the terminal

vim.opt.scrolloff = 9999 -- Always keep cursor in the middle of the screen (effectively)

vim.opt.splitright = true -- New vertical splits open to the right
vim.opt.splitbelow = true -- New horizontal splits open below

vim.opt.list = true -- Show invisible characters
vim.opt.listchars = { -- Define how invisible characters are displayed
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

vim.opt.cursorline = false -- Do not highlight the current line

vim.opt.timeout = true -- Enable timeout for key codes
vim.opt.timeoutlen = 800 -- Time in ms to wait for a mapped sequence

vim.opt.foldmethod = "marker" -- Use markers for folding

vim.opt.showmode = false -- Do not show the current mode

-- vim.opt.cmdheight = 0 -- Command-line height to 0 (hides it)
-- vim.opt.laststatus = 0 -- Never show the statusline
vim.opt.ruler = false -- Do not show the ruler
