-- Better searching
vim.o.hlsearch = false
vim.o.incsearch = true

-- Make line numbers default
vim.wo.number = true
-- vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Use win32yank as the clipboard provider on wsl
if vim.fn.has 'wsl' then
  vim.opt.clipboard = 'unnamedplus'
  vim.env.NVIM_TUI_ENABLE_CURSOR_SHAPE = '1'
  vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
      ['+'] = 'win32yank -i --crlf',
      ['*'] = 'win32yank -i --crlf',
    },
    paste = {
      ['+'] = 'win32yank -o --lf',
      ['*'] = 'win32yank -o --lf',
    },
    cache_enabled = 1,
  }
else
  vim.o.clipboard = 'unnamedplus'
end

vim.o.swapfile = false
vim.o.backup = false

if vim.fn.has("linux") == 1 then
  vim.o.undodir = os.getenv "HOME" .. "/.vim/undodir"
elseif vim.fn.has("windows") == 1 then
  vim.o.undodir = vim.fn.expand("$LOCALAPPDATA") .. "\\.vim\\undodir"
end

-- Enable break indent
vim.o.breakindent = true

-- Do your best neovim please
-- vim.o.smartindent = true

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
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.termguicolors = true

-- Hey this is pretty cool
vim.o.scrolloff = 8

-- I should've used these so long ago
vim.o.foldmethod = 'marker'
vim.o.foldcolumn = '1'
