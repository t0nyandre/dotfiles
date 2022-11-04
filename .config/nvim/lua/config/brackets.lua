local ok, config = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

config.setup({
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
  }
})
