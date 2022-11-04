local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  return
end

local keymap = vim.keymap.set

gitsigns.setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr" },
  },
  -- signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  numhl = true,
  attach_to_untracked = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  sign_priority = 6,
  update_debounce = 100,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  on_attach = function (bufnr)
    -- Jump to next hunk
    keymap("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })   

    -- Jump to prev hunk
    keymap("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })   
    
    -- Actions
    -- Reset hunk
    keymap("n", "<leader>rh", function()
      require("gitsigns").reset_hunk()
    end, {})   

    -- Preview hunk
    keymap("n", "<leader>ph", function()
      require("gitsigns").preview_hunk()
    end, {})   

    -- Blame line
    keymap("n", "<leader>gb", function()
      package.loaded.gitsigns.blame_line()
    end, {})   
    
    -- Toggle deleted
    keymap("n", "<leader>td", function()
      require("gitsigns").toggle_deleted()
    end, {})   
  end
})
