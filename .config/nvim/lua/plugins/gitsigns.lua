local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
    return
end

local keymap = vim.keymap.set
local opts = { silent = true }
-- Navigation through hunks
-- Jump to next hunk
keymap("n", "]c", function()
    if vim.wo.diff then
        return ']c'
    end
    vim.schedule(function()
        require('gitsigns').next_hunk()
    end)
    return '<Ignore>'
end, { expr = true })
-- Jump to previous hunk
keymap("n", "[c", function()
    if vim.wo.diff then
        return '[c'
    end
    vim.schedule(function()
        require('gitsigns').prev_hunk()
    end)
    return '<Ignore>'
end, { expr = true })

-- Actions
-- Reset hunk
keymap("n", "<leader>rh", function() require('gitsigns').reset_hunk() end, opts)
-- Preview hunk
keymap("n", "<leader>ph", function() require('gitsigns').preview_hunk() end, opts)
-- Blame line
keymap("n", "<leader>gb", function() package.loaded.gitsigns.blame_line() end, opts)
-- Toggle deleted
keymap("n", "<leader>td", function() require('gitsigns').toggle_deleted() end, opts)

gitsigns.setup({
    signs = {
      add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
      change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
      delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
      topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
      changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
    },
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
})
