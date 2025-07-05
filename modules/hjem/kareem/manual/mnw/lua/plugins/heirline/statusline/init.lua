local function req(path)
  return require("plugins.heirline.statusline." .. path)
end

return {
  req("mode"),
  req("filename"),
}
