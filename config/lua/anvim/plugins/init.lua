return {
  {
    "evergarden",
    lazy = false,
  },
  {
    "lylla",
    name = "lylla",
    lazy = false,
    deps = { "evergarden" },
  },
  {
    "artio",
    name = "artio",
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
