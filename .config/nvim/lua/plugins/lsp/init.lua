local ok, _ = pcall(require, "lspconfig")
if not ok then
    return
end

require("plugins.lsp.mason")
require("plugins.lsp.handlers").setup()
require("plugins.lsp.null-ls")
