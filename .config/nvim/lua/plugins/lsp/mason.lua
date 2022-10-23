local ok, mason = pcall(require, "mason")
if not ok then
    return
end

local servers = {
    "sumneko_lua",
    "cssls",
    "html",
    "tsserver",
    "jsonls",
    "yamlls",
    "lemminx",
}

local settings = {
    ui = {
        border = "none",
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ﮊ",
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
    }
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local config_ok, lspconfig = pcall(require, "lspconfig")
if not config_ok then
    return
end

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = require("plugins.lsp.handlers").capabilities,
    }

    local conf_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
    if conf_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
end
