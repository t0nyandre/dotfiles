local servers = {
  "sumneko_lua",
  "cssls",
  "html",
  "tsserver",
  "bashls",
  "jsonls",
  "yamlls",
  "lemminx",
  "rust_analyzer",
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ﮊ",
		},
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 5,
  },
}

local mason_ok, mason = pcall(require, "mason")
local maslsp_ok, mason_lsp_config = pcall(require, "mason-lspconfig")
local lspconf_ok, lspconfig = pcall(require, "lspconfig")
if not (mason_ok or maslsp_ok or lspconf_ok) then
  return
end

mason.setup(settings)
mason_lsp_config.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("config.lsp.handlers").on_attach,
    capabilities = require("config.lsp.handlers").capabilities,
  }
  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "config.lsp.settings." ..server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
