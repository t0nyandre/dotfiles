local keymap = vim.keymap.set
local opts = { silent = true }

-- Remap , as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","

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

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)       -- clear highlights
keymap("n", "<leader>w", "<cmd>Bdelete!<CR>", opts)         -- close buffer
keymap("v", "p", '"_dP', opts)                              -- better paste
keymap("i", "<C-c>", "<ESC>", opts)                         -- Ctrl+c to <ESC>

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
