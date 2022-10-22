local keymap = vim.keymap.set
local opts = { silent = true }

-- Remap leader key
keymap("", ",", "Nop", opts)
vim.g.mapleader = ","

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffer
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Create folder that does not exist
keymap("n", "<leader>nf", ":call mkdir(expand('%:p:h'), 'p')<CR>", opts)

-- Clear hightlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffer
keymap("n", "<leader>w", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP"', opts)

-- VISUAL MODE --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
