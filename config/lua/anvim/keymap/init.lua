local opts = { silent = true }

-- general ======================================================================================

vim.keymap.set("n", "<C-p>", "<cmd>_dP<cr>", opts)
vim.keymap.set("n", "<F5>", vim.cmd.Undotree, opts)

vim.keymap.set("n", "E", "<cmd>m .+1<cr>", opts)
vim.keymap.set("n", "I", "<cmd>m .-2<cr>", opts)

vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)

vim.keymap.set({ "i", "x" }, "<C-c>", "<C-[>")
vim.keymap.set({ "i", "x" }, "<Esc>", "<C-c>")

-- colemak ======================================================================================

local mappings = {
  h = "n",
  j = "e",
  k = "i",
  l = "o",
}

for rhs, lhs in pairs(mappings) do
  vim.keymap.set("n", lhs, rhs, opts)
  vim.keymap.set("n", "<C-w>" .. lhs, "<C-w>" .. rhs, opts)
  vim.keymap.set("n", "<C-w>" .. lhs:upper(), "<C-w>" .. rhs:upper(), opts)
end

vim.keymap.set("n", "<C-w>k", "<C-w>n")
vim.keymap.set("n", "<C-w>m", "<C-w>o")

vim.keymap.set("n", "t", "i", opts)
vim.keymap.set("n", "k", "o", opts)
vim.keymap.set("n", "h", "g", opts)

vim.keymap.set("n", "<C-,>", "<C-o>", opts)
vim.keymap.set("n", "<C-.>", "<C-i>", opts)

-- window things ================================================================================

vim.keymap.set("n", "<C-w>0", function ()
  vim.o.winwidth = 20 -- default
  vim.cmd [[wincmd=]]
end, opts)

vim.keymap.set("n", "<C-w>9", function ()
  vim.o.winwidth = 999
end, opts)

-- cool things ==================================================================================

vim.keymap.set({ "n", "v" }, "<leader>b", function()
  local m = "robin <comfysagedev" .. vim.fn.nr2char(64) .. "gmail.com>"

  if vim.api.nvim_get_mode().mode == "n" then
    local i = vim.fn.getpos(".")[2] - 1
    local line = vim.api.nvim_buf_get_lines(0, i, i + 1, true)[1]
    local new, n = string.gsub(line, "^([^:]+:)%s*(.*)$", "%1 " .. m, 1)

    if n > 0 then
      vim.api.nvim_buf_set_lines(0, i, i + 1, true, { new })

      return
    end
  end
  vim.api.nvim_paste(m, false, -1)
end, { noremap = true, silent = true, desc = "add boo:3" })
