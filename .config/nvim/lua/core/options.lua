local opt = vim.opt

opt.laststatus = 3
opt.showmode = false

opt.title = true
opt.clipboard = "unnamedplus"
opt.cursorline = false

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- search
opt.hlsearch = true
opt.ignorecase = true

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.fileencoding = "utf-8"
opt.swapfile = false

-- interval for writing swap file to disk, also used by gitsign
opt.updatetime = 250

opt.whichwrap:append "<>[]hl"

-- disable some builtin vim plugins
local builtin_plugins = {
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

for _, plugin in pairs(builtin_plugins) do
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
