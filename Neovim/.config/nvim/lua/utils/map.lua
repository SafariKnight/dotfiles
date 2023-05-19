local M = {}

local default_mappings = require("config.mappings")
---Load a mapping from mappings.lua
---@param section string
---@param function_opts? table
M.load_mapping = function(section, function_opts)
  vim.schedule(function()
  local map_section = function(sect)
    for mode, keys in pairs(sect) do
      for lhs, keybind_info in pairs(keys) do
        local rhs = keybind_info[1]
        local opts = vim.tbl_deep_extend("force", { silent = true, noremap = true, desc = keybind_info[2] }, keybind_info.opts or {})
        opts = vim.tbl_deep_extend("force", opts, function_opts or {})
        vim.keymap.set(mode, lhs, rhs, opts)
      end
    end
  end
  local mappings = default_mappings[section] or default_mappings["abc"]
  if type(mappings) == "function" then
    mappings = mappings()
  end

  map_section(mappings)
end)
end

return M
