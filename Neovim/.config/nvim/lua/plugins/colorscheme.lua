---@diagnostic disable: unused-local, undefined-field
-- Util Functions {{{

local bg_default = "#000000"
local fg_default = "#ffffff"

---@param c  string
local function hexToRgb(c)
  c = string.lower(c)
  return {
    tonumber(c:sub(2, 3), 16),
    tonumber(c:sub(4, 5), 16),
    tonumber(c:sub(6, 7), 16),
  }
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
local function blend(foreground, background, alpha)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = hexToRgb(background)
  local fg = hexToRgb(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format(
    "#%02x%02x%02x",
    blendChannel(1),
    blendChannel(2),
    blendChannel(3)
  )
end

local function darken(hex, amount, bg)
  return blend(hex, bg or bg_default, amount)
end

local function lighten(hex, amount, fg)
  return blend(hex, fg or fg_default, amount)
end

--- }}}

return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = true,
        theme = "wave",
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          ---@class ThemeColors
          local theme = colors.theme
          ---@class PaletteColors
          local palette = colors.palette
          return {
            TelescopeTitle = {
              fg = theme.ui.bg,
              -- bg = theme.ui.special,
              bg = palette.oniViolet,
              bold = true,
            },
            FloatTitle = {
              fg = theme.ui.bg,
              -- bg = theme.ui.special,
              bg = palette.oniViolet,
              bold = true,
            },
            Float = { bg = theme.ui.float.bg },
            FloatBorder = { fg = theme.ui.float.bg, bg = theme.ui.float.bg },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = {
              fg = theme.ui.fg_dim,
              bg = theme.ui.bg_m1,
            },
            TelescopeResultsBorder = {
              fg = theme.ui.bg_m1,
              bg = theme.ui.bg_m1,
            },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = {
              bg = theme.ui.bg_dim,
              fg = theme.ui.bg_dim,
            },
            TelescopeSelectionCaret = {
              link = "TelescopeSelection",
            },
            QuickScopePrimary = { fg = palette.lotusAqua, undercurl = true },
            QuickScopeSecondary = { fg = palette.lotusRed, undercurl = true },
          }
        end,
      })
      vim.cmd.colorscheme("kanagawa")
    end,
  },
}
