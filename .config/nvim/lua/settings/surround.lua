--
--    /$$      /$$$$$$                                                /$$
--   | $$     /$$$_  $$                                              | $$
--  /$$$$$$  | $$$$\ $$ /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$
-- |_  $$_/  | $$ $$ $$| $$__  $$| $$  | $$ |____  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
--   | $$    | $$\ $$$$| $$  \ $$| $$  | $$  /$$$$$$$| $$  \ $$| $$  | $$| $$  \__/| $$$$$$$$
--   | $$ /$$| $$ \ $$$| $$  | $$| $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$      | $$_____/
--   |  $$$$/|  $$$$$$/| $$  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$| $$      |  $$$$$$$
--    \___/   \______/ |__/  |__/ \____  $$ \_______/|__/  |__/ \_______/|__/       \_______/
--                                /$$  | $$   file: surround.lua
--                               |  $$$$$$/   url: github.com/t0nyandre
--                                \______/
--
local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
    return
end

surround.setup({})
