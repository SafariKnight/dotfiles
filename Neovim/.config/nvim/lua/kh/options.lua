-- better searching
vim.o.hlsearch = false
vim.o.incsearch = true

-- preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- hey this looks better
vim.o.cmdheight = 1

-- make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- disable mouse
vim.o.mouse = ''

-- use win32yank as the clipboard provider on wsl
if vim.fn.has 'wsl' then
  vim.opt.clipboard = 'unnamedplus'
  vim.env.nvim_tui_enable_cursor_shape = '1'
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

-- save undo history
vim.o.undofile = true
if vim.fn.has 'linux' == 1 then
  vim.o.undodir = vim.fn.expand '~/.vim/undodir'
elseif vim.fn.has 'windows' == 1 then
  vim.o.undodir = vim.fn.expand '$localappdata' .. '\\.vim\\undodir'
end

-- enable break indent
vim.o.breakindent = true

-- do your best neovim please
vim.o.smartindent = true

-- should've changed this so long ago
vim.o.wrap = false

-- case insensitive searching unless /c or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- decrease update time
vim.o.updatetime = 50
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.termguicolors = true

-- hey this is pretty cool
vim.o.scrolloff = 16

-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- sets how neovim will display certain whitespace characters in the editor.
-- `:help 'list'`
-- `:help 'listchars'`
vim.opt.list = false
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- show which line your cursos is on
vim.opt.cursorline = false

-- 300 (default) is so short man
vim.o.timeout = true
vim.o.timeoutlen = 800
