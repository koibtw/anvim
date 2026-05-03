vim.api.nvim_create_autocmd("ModeChanged", {
  callback = function()
    local mode = vim.fn.mode()

    if mode:match("[ncr]") then
      vim.opt.conceallevel = 2
    else
      vim.opt.conceallevel = 0
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local colors = require("evergarden.colors").get()

    vim.api.nvim_set_hl(0, "@checkedmark.markdown", { fg = colors.overlay0 })
    vim.api.nvim_set_hl(
      0,
      "@checkedtext.markdown",
      { fg = colors.overlay1, strikethrough = true }
    )
  end,
})
