-- require configs located in the ./lua/config folder
local config_files = {
  "impatient",
  "options",
  "keymaps",
  "packer",
  "autocommands",
  "colorscheme",
  "cmp",
  "telescope",
  "nvim-tree",
  "comment",
  "autopairs",
  "treesitter",
  "brackets",
  "gitsigns",
  "lualine",
  "toggleterm",
  "indentline",
  "illuminate",
  "lsp",
  "dap",
}

for _, config in pairs(config_files) do
  require("config." .. config)
end

-- disable some builtin vim plugins
local disable_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(disable_plugins) do
  vim.g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
