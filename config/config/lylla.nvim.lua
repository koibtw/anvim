local modes = {
  ["n"] = { "hello :3", "LyllaN" },
  ["i"] = { "type >ᴗ<", "LyllaI" },
  ["v"] = { "visual oᴗo", "LyllaV" },
  ["V"] = { "visual OᴗO", "LyllaV" },
  [""] = { "visual UᴗU", "LyllaV" },
  ["R"] = { "replace -ᴗ-", "LyllaR" },
  ["c"] = { "cmd xᴗx", "LyllaC" },
  ["no"] = { "no ???", "LyllaNO" },
}

local severities = {
  [1] = { "MiniIconsRed", "" },
  [2] = { "MiniIconsYellow", "" },
  [3] = { "MiniIconsBlue", "" },
  [4] = { "MiniIconsAzure", "" },
}

local colors = require("evergarden.colors").get()

local hl_groups = {
  ["N"] = { bg = colors.green },
  ["I"] = { bg = colors.text },
  ["V"] = { bg = colors.yellow },
  ["R"] = { bg = colors.blue },
  ["C"] = { bg = colors.purple },
  ["NO"] = { bg = colors.red },
  ["Surface"] = { bg = colors.surface0, fg = colors.subtext0 }
}

vim
  .iter(pairs(hl_groups))
  :map(function(n, v)
    return 0,
      string.format("Lylla%s", n),
      { default = true, bg = v.bg or colors.base, fg = v.fg or colors.crust }
  end)
  :each(vim.api.nvim_set_hl)

local lylla = require("lylla")
local utils = require("lylla.utils")

lylla.setup({
  refresh_rate = math.huge,
  modules = {
    lylla.component(function()
      local m = modes[vim.api.nvim_get_mode().mode]
      return { string.format(" %s ", m[1]), m[2] }
    end, {
      events = { "ModeChanged", "CmdlineEnter" },
    }),
    {" %l:%c %p%% ", "LyllaSurface"},
    lylla.component(function()
      if not package.loaded["vim.diagnostic"] then
        return ""
      end

      local diag = vim.diagnostic.get(0)

      local counts = vim.iter(ipairs(diag)):fold({}, function(v, _, d)
        v[d.severity] = (v[d.severity] or 0) + 1
        return v
      end)

      local formatted = vim
        .iter(pairs(counts))
        :map(function(s, c)
          local sev = severities[s]
          return { string.format(" %s %d", sev[2], c), sev[1] }
        end)
        :totable()

      return formatted
    end, {
      events = { "DiagnosticChanged" },
    }),
    { "%=" },
    lylla.component(function()
      local icons = require("mini.icons")

      local separator = " | "
      local modified = " "
      local filetype = vim.bo.filetype
      local filename = vim.fn.expand("%:t")
      local icon, icon_hl = icons.get("filetype", filetype)
      local _, file_hl =  icons.get("default", "file")

      if #filename == 0 then separator = "" end

      if vim.bo.modified then
        modified = " [+] "
      elseif not vim.bo.modifiable then
        modified = " [-] "
      end

      return {
        { modified },
        { utils.getfilepath()[1], file_hl },
        { filename, file_hl },
        { separator },
        { filetype },
        { " " },
        { icon, icon_hl },
        { " " },
      }
    end, {
      events = {
        "WinEnter",
        "BufEnter",
        "BufWritePost",
        "FileChangedShellPost",
        "Filetype",
      },
    }),
  },
})
