---Requires a file in this same directory
---@param filename string
local req = function (filename)
	if not filename then
		return
	end
	require("core." .. filename)
end


req("lazy")
