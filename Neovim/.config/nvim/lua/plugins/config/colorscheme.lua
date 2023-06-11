local M = {}
M.bg = "#000000"
M.fg = "#ffffff"

M.vscode = function ()
  local c = require('vscode.colors').get_colors()
  local dark_bg = M.darken(c.vscBack, 0.4)
  local darker_bg = M.darken(c.vscBack, 0.6)
  require('vscode').setup({
    style = 'dark',
    italic_comments = true,
    group_overrides = {
      TelescopeTitle = { bg = c.vscPink, fg = c.vscBack },
      TelescopeSelection = { bg = c.vscPopupHighlightBlue },
      TelescopeNormal = { bg = darker_bg, fg = c.vscFront },
      TelescopePromptBorder = { bg = darker_bg, fg = darker_bg },
      TelescopePreviewBorder = { bg = darker_bg, fg = darker_bg },
      TelescopePromptTitle = { bg = darker_bg, fg = darker_bg },
      TelescopePromptCounter = { bg = darker_bg, fg = darker_bg },
      TelescopeResultsNormal = { bg = dark_bg, fg = c.vscFront },
      TelescopeResultsBorder = { bg = dark_bg, fg = dark_bg },
    }
  })

  vim.cmd.colorscheme 'vscode'
end
---@param c  string
local function hexToRgb(c)
  c = string.lower(c)
  return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, background, alpha)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = hexToRgb(background)
  local fg = hexToRgb(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
  return M.blend(hex, bg or M.bg, amount)
end

function M.lighten(hex, amount, fg)
  return M.blend(hex, fg or M.fg, amount)
end

return M
