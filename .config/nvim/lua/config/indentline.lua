local ok, blankline = pcall(require, "indent_blankline")
if not ok then
  return
end

blankline.setup({
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "",
  },
  buftype_exclude = { "terminal", "nofile" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = false,
  use_treesitter = true,
})