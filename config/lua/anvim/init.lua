require("anvim.options")
require("anvim.lsp")
require("anvim.keymap")

-- ui2 ==========================================================================================

require("vim._core.ui2").enable({ enable = true, msg = { target = "msg" } })

-- lynn =========================================================================================

vim.iter(vim.api.nvim_get_runtime_file("lua/anvim/plugins/*.lua", true)):each(function(file)
  local name = string.gsub(vim.fs.basename(file), "%.lua$", "")
  require("lynn").import("anvim.plugins." .. name, true)
end)
require("lynn").setup()

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    if not vim.api.nvim_buf_is_loaded(ev.buf) then return end
    local ok, _ = pcall(vim.treesitter.start, ev.buf)
    if not ok then return end
    vim.bo.indentexpr = "v:lua.require('anvim.indent').get_indent_line()"
  end
})
