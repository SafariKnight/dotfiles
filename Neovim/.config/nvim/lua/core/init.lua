-- Options {{{
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

if vim.fn.has 'linux' == 1 then
  vim.o.undodir = os.getenv 'HOME' .. '/.vim/undodir'
elseif vim.fn.has 'windows' == 1 then
  vim.o.undodir = vim.fn.expand '$LOCALAPPDATA' .. '\\.vim\\undodir'
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
-- }}}
-- Mappings {{{
_G.map = function(m, k, v, desc, extra_opts)
  local opts = { noremap = true, silent = true, desc = desc }
  opts = vim.tbl_deep_extend('force', opts, extra_opts or {})
  desc = desc or ''
  vim.keymap.set(m, k, v, opts)
end

-- Centered Actions
map('n', '<C-d>', '<C-d>zz', 'Down half a page')
map('n', '<C-u>', '<C-u>zz', 'Up   half a page')
map('n', 'n', 'nzz', 'Next result')
map('n', 'N', 'Nzz', 'Previous result')

-- Improved default mappings
map('n', 'J', "maJ'a", 'Append next line on current line')
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", 'Up', { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", 'Down', { expr = true })

-- don't hate me pls
map({ 'n', 'v', 'i' }, '<C-c>', '<ESC>')

-- this is gud
map('n', '<leader>q', '<CMD>wa<CR><C-z>', 'minimize')
-- }}}
-- Custom Commands {{{
vim.api.nvim_create_user_command("LspCapabilities", function()
	local curBuf = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_active_clients { bufnr = curBuf }

	for _, client in pairs(clients) do
		if client.name ~= "null-ls" then
			local capAsList = {}
			for key, value in pairs(client.server_capabilities) do
				if value and key:find("Provider") then
					local capability = key:gsub("Provider$", "")
					table.insert(capAsList, "- " .. capability)
				end
			end
			table.sort(capAsList) -- sorts alphabetically
			local msg = "# " .. client.name .. "\n" .. table.concat(capAsList, "\n")
			vim.notify(msg, vim.log.levels.TRACE, {
				on_open = function(win)
					local buf = vim.api.nvim_win_get_buf(win)
					vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
				end,
				timeout = 14000,
			})
      vim.fn.setreg("+", "Capabilities = " .. vim.inspect(client.server_capabilities))
		end
	end
end, {})
-- }}}

require 'core.autocmds'
require 'core.lazy'
