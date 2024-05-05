vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Tabs & indentation
opt.tabstop = 4       -- for tabs
opt.shiftwidth = 4    -- for indent width
opt.expandtab = true  -- soft tabs
opt.autoindent = true -- indent new lines automatically

opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true -- if the case is mixed, search is case-sensitive

opt.cursorline = true

-- True color in terminal
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default

-- Split directions
opt.splitright = true
opt.splitbelow = true

-- Show some whitespace characters
opt.list = true 

-- Keep 20 lines above and below cursor
opt.scrolloff = 10

-- Make status line global
opt.laststatus = 3

