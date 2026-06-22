require("anvim.options")
require("anvim.lsp")
require("anvim.keymap")
require("anvim.treesitter")

-- ui2 ==========================================================================================

require("vim._core.ui2").enable({
  enable = true,
  msg = {
    targets = {
      default = "msg",
      bufwrite = "msg",
      shell_cmd = "msg",
      shell_err = "msg",
      shell_out = "msg",
      shell_ret = "msg",
    },
  },
})

-- lynn =========================================================================================

vim.iter(vim.api.nvim_get_runtime_file("lua/anvim/plugins/*.lua", true)):each(function(file)
  local name = string.gsub(vim.fs.basename(file), "%.lua$", "")
  require("lynn").import("anvim.plugins." .. name, true)
end)
require("lynn").setup()
