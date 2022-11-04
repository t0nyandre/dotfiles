local ok, project = pcall(require, "project_nvim")
if not ok then
  return
end

project.setup({
  detection_methods = { "pattern" },
  patterns = { ".git", "Makefile", "Cargo.toml", "package.json"}
})

local tele_ok, telescope = pcall(require, "telescope")
if not tele_ok then
  return
end

telescope.load_extension("projects")
