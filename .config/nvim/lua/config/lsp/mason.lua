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
  "taplo",
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

  if server == "sumneko_lua" then
    local sumneko_opts = require("config.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "rust_analyzer" then
    local ok, rust_tools = pcall(require, "rust-tools")
    if not ok then
      goto continue
    end

    rust_tools.setup({
      tools = {
        on_initialized = function()
          vim.cmd[[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]]
        end,
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          auto = true,
          show_parameter_hints = true,
          parameter_hints_prefix = "",
          other_hints_prefix = "",
        },
        server = {
          settings = {
            ["rust-analyzer"] = {
              lens = {
                enable = true,
              },
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      },
    })

    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
