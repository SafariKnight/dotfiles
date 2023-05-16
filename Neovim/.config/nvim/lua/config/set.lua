vim.o.breakindent = true

vim.o.ignorecase = true

vim.o.smartcase = true

vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.completeopt = "menuone,noselect"

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.o.expandtab = true

vim.o.smartindent = true

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false

if vim.fn.has("linux") == 1 then
  vim.o.undodir = os.getenv "HOME" .. "/.vim/undodir"
elseif vim.fn.has("windows") == 1 then
  vim.o.undodir = vim.fn.expand("$LOCALAPPDATA") .. "\\.vim\\undodir"
end

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.updatetime = 50

vim.o.splitbelow = true

vim.o.splitright = true

-- Use win32yank as the clipboard provider on wsl
if vim.fn.has('wsl') then
  vim.opt.clipboard = "unnamedplus"
  vim.env.NVIM_TUI_ENABLE_CURSOR_SHAPE = "1"
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
  vim.o.clipboard = "unnamedplus"
end
