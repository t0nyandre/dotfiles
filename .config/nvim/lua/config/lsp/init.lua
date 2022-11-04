local ok, _ = pcall(require, "lspconfig")
if not ok then
  return
end

require("config.lsp.mason")
require("config.lsp.handlers").setup()
require("config.lsp.null-ls")
