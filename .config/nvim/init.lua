vim.defer_fn(function()
	pcall(require, "impatient")
end, 0)

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- Core settings
require("core.options")
require("core.mappings")
require("core.autocommands")
-- Install plugins
require("plugins")
-- Config for plugins
require("plugins.colorscheme")
require("plugins.cmp")
require("plugins.lsp")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.autopairs")
require("plugins.nvimtree")
require("plugins.comment")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.bufferline")
require("plugins.impatient")
