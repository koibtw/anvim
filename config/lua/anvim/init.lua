require("anvim.options")
require("anvim.treesitter")
require("anvim.lsp")

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

require("lynn").import("anvim.plugins", true)
require("lynn").setup()
