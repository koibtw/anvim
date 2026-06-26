if vim.g.loaded_anvim_spell then
  return
end

vim.g.loaded_anvim_spell = true

local spell_filetypes = {
  "markdown",
  "mail",
  "jjdescription",
  "html",
  "gitcommit",
  "nroff",
  "groff",
  "trinket",
}

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    vim.wo.spell = vim.tbl_contains(spell_filetypes, vim.bo[ev.buf].filetype)
  end,
})

vim.api.nvim_set_hl(0, "SpellCap", {})
