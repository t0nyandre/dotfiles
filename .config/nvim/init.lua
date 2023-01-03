--
--    /$$      /$$$$$$                                                /$$
--   | $$     /$$$_  $$                                              | $$
--  /$$$$$$  | $$$$\ $$ /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$
-- |_  $$_/  | $$ $$ $$| $$__  $$| $$  | $$ |____  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
--   | $$    | $$\ $$$$| $$  \ $$| $$  | $$  /$$$$$$$| $$  \ $$| $$  | $$| $$  \__/| $$$$$$$$
--   | $$ /$$| $$ \ $$$| $$  | $$| $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$      | $$_____/
--   |  $$$$/|  $$$$$$/| $$  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$| $$      |  $$$$$$$
--    \___/   \______/ |__/  |__/ \____  $$ \_______/|__/  |__/ \_______/|__/       \_______/
--                                /$$  | $$   file: init.lua
--                               |  $$$$$$/   url: github.com/t0nyandre
--                                \______/
--
local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	return
end

impatient.enable_profile()
require("settings.options")
require("settings.keymaps")
require("settings.plugins")
require("settings.autocommands")
require("settings.colorscheme")
require("settings.gopher")
require("settings.cmp")
require("settings.dap")
require("settings.lsp")
require("settings.telescope")
require("settings.autopairs")
require("settings.comment")
require("settings.indentline")
require("settings.nvimtree")
require("settings.gitsigns")
require("settings.illuminate")
require("settings.lualine")
require("settings.surround")
require("settings.term")
require("settings.treesitter")
require("settings.copilot")
