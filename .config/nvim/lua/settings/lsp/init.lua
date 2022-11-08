--
--    /$$      /$$$$$$                                                /$$
--   | $$     /$$$_  $$                                              | $$
--  /$$$$$$  | $$$$\ $$ /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$
-- |_  $$_/  | $$ $$ $$| $$__  $$| $$  | $$ |____  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
--   | $$    | $$\ $$$$| $$  \ $$| $$  | $$  /$$$$$$$| $$  \ $$| $$  | $$| $$  \__/| $$$$$$$$
--   | $$ /$$| $$ \ $$$| $$  | $$| $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$      | $$_____/
--   |  $$$$/|  $$$$$$/| $$  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$| $$      |  $$$$$$$
--    \___/   \______/ |__/  |__/ \____  $$ \_______/|__/  |__/ \_______/|__/       \_______/
--                                /$$  | $$   file: lsp/init.lua
--                               |  $$$$$$/   url: github.com/t0nyandre
--                                \______/
--
local mason_status_ok, mason = pcall(require, "mason")
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
local icons_status_ok, icons = pcall(require, "settings.icons")
local null_ls_ok, _ = pcall(require, "settings.lsp.null-ls")
if not (lspconfig_status_ok or mason_status_ok or icons_status_ok or null_ls_ok) then
	return
end

mason.setup({
	ui = {
		border = "none",
		icons = {
			package_pending = icons.ui.Dashboard .. " ",
			package_installed = icons.ui.BoxChecked .. " ",
			package_uninstalled = " " .. icons.misc.Skull,
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
})

local opts = {
	on_attach = require("settings.lsp.handlers").on_attach,
	capabilities = require("settings.lsp.handlers").capabilities,
}

lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}, opts))

lspconfig.gopls.setup(vim.tbl_deep_extend("force", {
	settings = {
		gopls = {
			usePlaceholders = true,
			gofumpt = true,
			codelenses = {
				generate = false,
				gc_details = true,
				test = true,
				tidy = true,
			},
		},
	},
}, opts))

lspconfig.cssls.setup(opts)
lspconfig.html.setup(opts)
lspconfig.jsonls.setup(opts)
lspconfig.lemminx.setup(opts)
lspconfig.yamlls.setup(opts)
lspconfig.tsserver.setup(opts)
lspconfig.bashls.setup(opts)
