vim.loader.enable()
vim.g.mapleader = " "

---@diagnostic disable-next-line: lowercase-global
-- vim.keymap.set = vim.keymap.set

require("kh.options")
require("kh.keymaps")

vim.cmd.colorscheme("habamax")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { import = "plugins" }
}

local lazy_opts = {
  install = {
    colorscheme = { "nord" },
  },
  default = {
    lazy = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}

require("lazy").setup(plugins, lazy_opts)

-- Neovide
if vim.g.neovide then -- why is this here, I don't use neovide
  vim.o.guifont = "MonoLisa:h13"
end
