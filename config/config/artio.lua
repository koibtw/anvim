vim.ui.select = require("artio").select

vim.keymap.set("n", "<C-t>", "<Plug>(artio-smart)")
vim.keymap.set("n", "<Space>", "<Plug>(artio-grep)")
