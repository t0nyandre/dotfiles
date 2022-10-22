local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    return
end

local options = {
    ensure_installed = {
        "lua",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    autopairs = {
        enable = true
    },
    indent = {
        enable = true,
        disable = { "python", "css" }
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    },
}

treesitter.setup(options)
