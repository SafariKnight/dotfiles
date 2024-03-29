-- Better searching
vim.o.hlsearch = false
vim.o.incsearch = true

-- Hey this looks better
vim.o.cmdheight = 0

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Use win32yank as the clipboard provider on wsl
if vim.fn.has 'wsl' then
  vim.opt.clipboard = 'unnamedplus'
  vim.env.NVIM_TUI_ENABLE_CURSOR_SHAPE = '1'
  vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 1,
  }
else
  vim.o.clipboard = 'unnamedplus'
end

vim.o.swapfile = false
vim.o.backup = false

if vim.fn.has 'linux' == 1 then
  vim.o.undodir = os.getenv 'HOME' .. '/.vim/undodir'
elseif vim.fn.has 'windows' == 1 then
  vim.o.undodir = vim.fn.expand '$LOCALAPPDATA' .. '\\.vim\\undodir'
end

-- Enable break indent
vim.o.breakindent = true

-- Do your best neovim please
vim.o.smartindent = true

-- Should've changed this so long ago
vim.o.wrap = false

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set tabs to 4 spaces
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.termguicolors = true

-- Hey this is pretty cool
vim.o.scrolloff = 8

-- I should've used these so long ago
vim.o.foldmethod = 'marker'
-- vim.o.foldmethod = 'manual'
vim.o.foldcolumn = '1'

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ','


-- Luarocks RTP
vim.o.runtimepath = vim.opt.runtimepath:append(",~/.luarocks/share")

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

-- Cache for base46 plugin
vim.g.base46_cache = vim.fn.stdpath('data') .. '/base46_cache/'
