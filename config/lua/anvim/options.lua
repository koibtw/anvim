-- basics ==========================================================================================
vim.o.encoding = "utf-8"

vim.o.mouse = ""
vim.o.exrc = true

vim.o.shell = os.getenv("SHELL") or "/bin/sh"

vim.o.jumpoptions = "stack,view,clean"

vim.o.keywordprg = ":vertical botright help"
vim.o.rulerformat = "%Ll %l:%c %3p%%"
vim.o.colorcolumn = "+1"

-- decrease update time
vim.o.updatetime = 250

vim.o.timeout = false
-- decrease mapped sequence wait time
vim.o.timeoutlen = 0

-- externals =======================================================================================
vim.o.grepprg = vim.fn.executable("rg") == 1 and "rg --vimgrep -. --" or "grep -rni --"
vim.o.grepformat = "%f:%l:%c:%m"
vim.g.findprg = vim.fn.executable("fd") == 1 and "fd -H -p -t f --color=never --" or "find . -type f -iregex '.*$*.*'"

-- ui ==============================================================================================

-- don't show the mode, since it's already in the status line
vim.o.showmode = false
vim.o.showcmd = false
vim.o.showtabline = 0
vim.o.cmdheight = 1
-- always show statusline at the bottom
vim.o.laststatus = 3
-- always show 1 column of sign column (gitsigns, etc.)
vim.o.signcolumn = "yes:1"
-- hide search notices, intro
vim.opt.shortmess:append("sI")

-- line numbers
vim.o.number = true
vim.o.relativenumber = false

vim.o.cursorline = false
vim.o.cursorlineopt = "both"

-- scroll offsets
vim.o.scrolloff = 0
vim.o.sidescrolloff = 0
vim.o.mousescroll = "ver:1,hor:1"

-- split directions
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = "screen"

-- features ========================================================================================

-- search settings
vim.o.incsearch = true -- show search results while typing
vim.o.hlsearch = true
vim.o.ignorecase = true -- ignore case when searching; use `\C` to reset
vim.o.infercase = true -- infer letter cases for a richer built-in keyword completion
vim.o.smartcase = true -- don't ignore case when searching if pattern has upper case
-- substitution with preview window
vim.o.inccommand = "split"

-- completion options
vim.o.pumheight = 8
vim.o.pummaxwidth = 42
vim.opt.wildoptions = { "pum", "tagfile" }
vim.opt.wildmode = { "list", "full" }
vim.o.complete = ""
vim.opt.completeopt = { "menuone", "noinsert" }
vim.o.autocomplete = false
vim.opt.shortmess:append("c") -- don't show autocomplete messages

-- editor config ===================================================================================

-- indentations settings
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 0 -- dont insert spaces on <tab>
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smarttab = true
-- enable break indent
vim.o.breakindent = true
vim.o.wrap = false

-- session state ===================================================================================
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undodir = vim.fn.stdpath("state") .. "/undodir"
vim.o.undofile = true
-- dont unload abandoned buffers
vim.o.hidden = true
vim.o.sessionoptions = "help,tabpages,winsize"

vim.g.rustfmt_autosave = 1

-- diagnostics =====================================================================================
vim.diagnostic.config({
  signs = false,
  underline = true,
  virtual_text = false,
  virtual_lines = {
    current_line = true,
  },
  update_in_insert = true,
})
