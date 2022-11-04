local tree_ok, treesitter = pcall(require, "nvim-treesitter")
local config_ok, configs = pcall(require, "nvim-treesitter.configs")
if not (tree_ok or config_ok) then
  return
end

configs.setup({
  ensure_installed = {
    "lua",
    "markdown",
    "markdown_inline",
    "bash"
  },
  highlight = {
    enable = true,
    disable = {
      "css"
    }
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {
      "css"
    }
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = true
  }
})
