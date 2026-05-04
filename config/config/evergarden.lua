require("evergarden").setup({
  theme = {
    variant = "fall",
    accent = "green",
  },
  overrides = function(theme)
    return {
      ["@checkedmark.markdown"] = { theme.overlay0 },
      ["@checkedtext.markdown"] = { theme.overlay1, style = { "strikethrough" } },
    }
  end,
})

vim.cmd.colorscheme("evergarden")
