--
--    /$$      /$$$$$$                                                /$$
--   | $$     /$$$_  $$                                              | $$
--  /$$$$$$  | $$$$\ $$ /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$
-- |_  $$_/  | $$ $$ $$| $$__  $$| $$  | $$ |____  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
--   | $$    | $$\ $$$$| $$  \ $$| $$  | $$  /$$$$$$$| $$  \ $$| $$  | $$| $$  \__/| $$$$$$$$
--   | $$ /$$| $$ \ $$$| $$  | $$| $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$      | $$_____/
--   |  $$$$/|  $$$$$$/| $$  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$| $$      |  $$$$$$$
--    \___/   \______/ |__/  |__/ \____  $$ \_______/|__/  |__/ \_______/|__/       \_______/
--                                /$$  | $$   file: options.lua
--                               |  $$$$$$/   url: github.com/t0nyandre
--                                \______/
--
local set = vim.opt
set.background = "dark"
set.clipboard = "unnamedplus"
set.backup = false
set.swapfile = false
set.cmdheight = 1
set.completeopt = "menu,menuone,noselect"
set.fileencoding = "utf-8"
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.mouse = "a"
set.showmode = false
set.title = true
set.showtabline = 0
set.smartcase = true
set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.undofile = true
set.updatetime = 100
set.writebackup = false

set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.expandtab = true
set.smartindent = true

set.number = true
set.relativenumber = true
set.cursorline = true

set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldmethod = "manual"

set.laststatus = 3
set.showcmd = false
set.ruler = false
set.numberwidth = 2
set.signcolumn = "yes"
set.wrap = false
set.scrolloff = 10
set.fillchars = { eob = " " }
set.shortmess:append("sI")
set.whichwrap:append("<>[]hl")
set.iskeyword:append("-")
