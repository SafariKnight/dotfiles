local utils = require("heirline.utils")
local conditions = require("heirline.conditions")
local disabled = {
  "oil",
}

local function is_enabled(filetype)
  for _, v in ipairs(disabled) do
    if v == filetype then
      return false
    end
  end
  return true
end

local text = function(str)
  return {
    provider = str,
  }
end

local Space = text(" ")
local Block = {
  init = function(self)
    self.file = vim.api.nvim_buf_get_name(0)
    self.filetype = vim.bo.filetype
  end,
  condition = function()
    return is_enabled(vim.bo.filetype)
  end,
}

local Icon = {
  provider = function(self)
    local icon
    ---@diagnostic disable-next-line: undefined-global
    icon, self.color = MiniIcons.get("filetype", self.filetype)
    if not icon then
      return ""
    end
    return icon
  end,
  hl = function(self)
    return {
      fg = utils.get_highlight(self.color).fg,
    }
  end,
}

local Flags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "[+]",
    hl = { fg = "green" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "  ",
    hl = { fg = "red" },
  },
}

local Name = {
  provider = function(self)
    if self.file == "" then
      return "[No Name]"
    end
    local formattedName = vim.fn.fnamemodify(self.file, ":~:.")
    if conditions.width_percent_below(#formattedName, 0.4) then
      return formattedName
    end
    return vim.fn.pathshorten(formattedName)
  end,
  hl = { fg = utils.get_highlight("Directory").fg },
}

return utils.insert(
  Block,
  Space,
  Icon,
  Space,
  Name,
  Space,
  text("%3("),
  Flags,
  text("%)"),
  text("%<")
)
