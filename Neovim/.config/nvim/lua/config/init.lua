local function req(filename)
	require("config." .. filename)
end

req("lazy")
req("set")
require("utils.map").load_mapping("abc")
