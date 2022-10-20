local status_ok_ts, treesitter = pcall(require, "nvim-treesitter")
if not status_ok_ts then
    return
end

local status_ok_tsconfig, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok_tsconfig then
    return
end

configs.setup({
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python" },
    ignore_install = { "" },
    sync_install = false,

    highlight = {
        enable = true,
        disable = { "css" },
    },
    autopairs = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { "python", "css" }
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
