local function req(filename)
	require("config." .. filename)
end

req("lazy")
req("set")
-- req("highlights")
require("utils.map").load_mapping("abc")
