if vim.g.loaded_anvim_conceallevel then
  return
end

vim.g.loaded_anvim_conceallevel = true

vim.api.nvim_create_autocmd("ModeChanged", {
  callback = function()
    local mode = vim.api.nvim_get_mode().mode

    if mode:match("^[ncr]") then
      vim.o.conceallevel = 2
    else
      vim.o.conceallevel = 0
    end
  end,
})
