local M = {}
local all_mappings = require("config.mappings")

---Calls a table containing keybinds from config.mappings
---@param sect table
---@param function_opts table?
M.load_general_mapping = function(sect, function_opts)
		if type(sect) == "function" then
			sect = sect()
		end
		for mode, keys in pairs(sect) do
			for lhs, keybind_info in pairs(keys) do
				local rhs = keybind_info[1]
				local opts = vim.tbl_deep_extend(
					"force",
					{ silent = true, noremap = true, desc = keybind_info[2] },
					keybind_info.opts or {}
				)
				opts = vim.tbl_deep_extend("force", opts, function_opts or {})
				vim.keymap.set(mode, lhs, rhs, opts)
			end
		end
end

---Add mappings to lazy spec of a plugin
---@param keybinds_table table
---@param extra_opts table?
---@return table
M.lazy_map_parse = function(keybinds_table, extra_opts)
	if type(keybinds_table) == "function" then
		keybinds_table = keybinds_table()
	end
	local added_binding = {}
	local new_binds = {}
	for mode, keybinds in pairs(keybinds_table) do
		for lhs, keybind in pairs(keybinds) do
			added_binding = { lhs, keybind[1], mode = mode, desc = keybind[2] }
      if extra_opts ~= nil then
				added_binding = vim.tbl_deep_extend("force", added_binding, extra_opts)
      end
			if keybind[3] ~= nil then
				added_binding = vim.tbl_deep_extend("force", added_binding, keybind[3])
			end

			new_binds[#new_binds + 1] = added_binding -- Append
		end
	end
	return new_binds
end

---Load a mapping from mappings.lua
---@param section string
---@param extra_opts? table
M.load_mapping = function(section, extra_opts)
	local selected_section = all_mappings[section]
  if type(selected_section) == "function" then
    selected_section = selected_section()
  end
	if section == "abc" then
		return M.load_general_mapping(selected_section, extra_opts)
	else
    return M.lazy_map_parse(selected_section, extra_opts)
	end
end

return M
