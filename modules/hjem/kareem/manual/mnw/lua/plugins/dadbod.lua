return {
  "vim-dadbod-ui",
  beforeAll = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_force_echo_notifications = 0
    vim.g.db_ui_show_help = 0
    vim.g.db_ui_win_position = "right"
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_use_nvim_notify = 1
  end,
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
}
