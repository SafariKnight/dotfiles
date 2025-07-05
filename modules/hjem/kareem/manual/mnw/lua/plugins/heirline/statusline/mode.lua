return {
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,
  static = {
    mode_names = {
      n = "N",
      no = "O",
      nov = "O",
      noV = "O",
      ["no\22"] = "O",
      niI = "i",
      niR = "r",
      niV = "v",
      nt = "T",
      ntT = "N",
      v = "v",
      vs = "v",
      V = "x",
      Vs = "x",
      ["\22"] = "X",
      ["\22s"] = "X",
      s = "s",
      S = "S",
      ["\19"] = "S",
      i = "I",
      ic = "I",
      ix = "I",
      R = "R",
      Rc = "R",
      Rx = "R",
      Rv = "R",
      Rvc = "R",
      Rvx = "R",
      c = "C",
      cr = "C",
      cv = "C",
      cvr = "C",
      r = "E",
      rm = "M",
      ["r?"] = "F",
      ["!"] = "!",
      t = "t",
    },

    mode_colors = {
      n = "red",
      i = "green",
      v = "cyan",
      V = "cyan",
      ["\22"] = "cyan",
      c = "orange",
      s = "purple",
      S = "purple",
      ["\19"] = "purple",
      R = "orange",
      r = "orange",
      ["!"] = "red",
      t = "red",
    },
  },
  provider = function(self)
    return " %(" .. self.mode_names[self.mode] .. "%) "
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { fg = "white", bg = self.mode_colors[mode], bold = true }
  end,
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
}
