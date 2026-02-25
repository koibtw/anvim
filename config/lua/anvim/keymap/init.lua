local opts = { noremap = true, silent = true }

-- general =========================================================================================

vim.keymap.set("n", "<C-p>", "<cmd>_dP<cr>", opts)
vim.keymap.set("n", "<C-t>", "<Plug>(artio-smart)", opts)
vim.keymap.set("n", "<Space>", "<Plug>(artio-grep)", opts)
vim.keymap.set("n", "<F5>", vim.cmd.Undotree, opts)

vim.keymap.set("n", "E", "<cmd>m .+1<cr>", opts)
vim.keymap.set("n", "I", "<cmd>m .-2<cr>", opts)

vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)

-- colemak =========================================================================================

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
