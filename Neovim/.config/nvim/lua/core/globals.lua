_G.set_colors = function(colorscheme)
  vim.o.termguicolors = true
  colorscheme = colorscheme or 'sonokai'
  -- colorscheme = colorscheme or 'rose-pine'
  vim.cmd.colorscheme(colorscheme)
end

_G.keybind = {
  mode = 'n',
  added_opts = {},
}

setmetatable(keybind, {
  __newindex = function(t, k, keybinds)
    local rhs = keybinds[1]
    local opts = vim.tbl_deep_extend(
      'force',
      { silent = true, noremap = true, desc = keybinds[2] },
      keybinds.opts or {}
    )
    opts = vim.tbl_deep_extend('force', opts, t.added_opts or {})
    vim.keymap.set(t.mode, k, rhs, opts)
    -- vim.fn.getpos('v')
  end,
})

function _G.get_visual_selection() -- Stolen from nvim-spectre
    local start_pos = vim.api.nvim_buf_get_mark(0, '<')
    local end_pos = vim.api.nvim_buf_get_mark(0, '>')
    local lines = vim.fn.getline(start_pos[1], end_pos[1])
    -- add when only select in 1 line
    local plusEnd = 0
    local plusStart = 1
    if #lines == 0 then
        return ''
    elseif #lines == 1 then
        plusEnd = 1
        plusStart = 1
    end
    lines[#lines] = string.sub(lines[#lines], 0, end_pos[2] + plusEnd)
    lines[1] = string.sub(lines[1], start_pos[2] + plusStart, string.len(lines[1]))
    local query = table.concat(lines, '')
    return query
end
