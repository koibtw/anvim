require("anvim.options")
require("anvim.lsp")
require("anvim.keymap")

-- ui2 =============================================================================================

require("vim._core.ui2").enable({ enable = true, msg = { target = "msg" } })

-- lynn ============================================================================================

vim.iter(vim.api.nvim_get_runtime_file("lua/anvim/plugins/*.lua", true)):each(function(file)
  local name = string.gsub(vim.fs.basename(file), "%.lua$", "")
  require("lynn").import("anvim.plugins." .. name, true)
end)
require("lynn").setup()
