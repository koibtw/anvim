vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.bo.indentexpr = "v:lua.require('anvim.treesitter.indent').get_indent_line()"
  end,
})

local start_filetypes = {
  "bash",
  "c",
  "cpp",
  "dockerfile",
  "go",
  "gomod",
  "gosum",
  "gotmpl",
  "javascript",
  "jq",
  "jsdoc",
  "json",
  "just",
  "lua",
  "luadoc",
  "make",
  "markdown",
  "markdown_inline",
  "nix",
  "python",
  "sql",
  "toml",
  "typescript",
  "vim",
  "yaml",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = start_filetypes,
  callback = function(ev)
    if not vim.api.nvim_buf_is_loaded(ev.buf) then
      return
    end
    local ok, _ = pcall(vim.treesitter.start, ev.buf)
    if not ok then
      return
    end
  end,
})
