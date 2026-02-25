return {
  {
    "evergarden",
    lazy = false,
  },
  {
    "lylla.nvim",
    name = "lylla.nvim",
    lazy = false,
    deps = { "evergarden" },
  },
  {
    "artio.nvim",
    name = "artio.nvim",
    deps = { "mini.icons" },
    lazy = false,
  },
  {
    "blink.cmp",
    name = "blink.cmp",
    event = "VimEnter",
  },
  {
    "indent-blankline.nvim",
    name = "indent-blankline.nvim",
    event = "UIEnter",
  },
  {
    "nvim-colorizer.lua",
    name = "nvim-colorizer.lua",
    event = "UIEnter",
  },
  {
    "mini.icons",
    name = "mini.icons",
  },
  {
    "mini.diff",
    name = "mini.diff",
    event = "VimEnter",
  },
  {
    "mini.pairs",
    name = "mini.pairs",
    event = "VimEnter",
  },
  {
    "cord.nvim",
    name = "cord.nvim",
  },
  {
    "jule.nvim",
    name = "jule.nvim",
    event = "FileType jule",
  },

  { "nvim.undotree", event = "UIEnter" },
}
