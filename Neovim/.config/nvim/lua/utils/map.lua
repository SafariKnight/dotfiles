local M = {}

---Calls a table containing keybinds from config.mappings
---@param section string?
---@param function_opts table?
M.load_mapping = function(section, function_opts)
  local map_section = function(sect)
    if sect.plugin then
      return
    end
    sect.plugin = nil
    for mode, keys in pairs(sect) do
      for lhs, keybind_info in pairs(keys) do
        local rhs = keybind_info[1]
        local opts = vim.tbl_deep_extend("force", { silent = true, noremap = true, desc = keybind_info[2] }, keybind_info.opts or {})
        opts = vim.tbl_deep_extend("force", opts, function_opts or {})
        vim.keymap.set(mode, lhs, rhs, opts)
      end
    end
  end
  local mappings = require("config.mappings")
  section = section or "abc"
  if mappings[section].plugin then
    mappings[section].plugin = nil
    mappings = mappings[section]
  else mappings = mappings["abc"] end

  map_section(mappings)
end

return M
