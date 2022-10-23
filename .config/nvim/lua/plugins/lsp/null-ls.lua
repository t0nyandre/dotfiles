local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        formatting.prettier.with {
            extra_filetypes = { "toml" },
        },
        formatting.stylua.with {
            extra_args = {
                "--indent_type", "Spaces",
                "--call_parentheses", "NoSingleTable",
            }
        },
        formatting.xmllint,
    },
}