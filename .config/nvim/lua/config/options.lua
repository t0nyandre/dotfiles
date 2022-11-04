local o = vim.opt

o.backup = false				                      -- create a backup file (true/false)
o.clipboard = "unnamedplus"		          	    -- allows neovim to access system clipboard
o.cmdheight = 1					                      -- more space for displaying messages in cmdline
o.completeopt = "menu,menuone,noselect"      	-- cmp stuff
o.conceallevel = 0
o.fileencoding = "utf-8"			                -- force encoding written to a file
o.hlsearch = true				                      -- highlight matches in search
o.ignorecase = true				                    -- ignore case in search patterns
o.mouse = "a"                                 -- allow the use of mouse in neovim
o.pumheight = 10				                      -- pop up menu height
o.showmode = false				                    -- remove -- INSERT -- etc.
o.title = true
o.showtabline = 0
o.smartcase = true
o.splitbelow = true				                    -- force all horizontal splits to go below current window
o.splitright = true			                    	-- force all vertical splits to go to the right of current window
o.swapfile = false				                    -- create swapfile
o.termguicolors = true				                -- set term gui colors
o.timeoutlen = 400
o.undofile = true				                      -- enable persistent undo
o.updatetime = 300				                    -- faster completion
o.writebackup = false				                  -- not allowed to edit if it's being edited by another program

-- Indenting
o.expandtab = true				                    -- convert tabs to spaces
o.shiftwidth = 2				                      -- number of spaces inserted for each indentation
o.smartindent = true				                  -- make indenting smarter again :D
o.tabstop = 2					                        -- insert 2 spaces for a tab
o.softtabstop = 2

-- Styling
o.number = true                               -- enable numbers
o.relativenumber = true                       -- enable relative numbers
o.cursorline = true				                    -- highlight current line

o.laststatus = 3                              -- only the last window will have a status line
o.showcmd = false                             -- hide (partial) command in the last line of the screen
o.ruler = false                               -- hide the line and col number of the cursor pos
o.numberwidth = 2                             -- min number of columns to use for the line number
o.signcolumn = "yes"                          -- always show the sign column, otherwise it would shift the text each time
o.wrap = false                                -- display lines as one long line
o.scrolloff = 10                              -- minimum number of screen lines to keep above and below the cursor
o.sidescrolloff = 5                           -- minimum number of screen col to keep to the left and right of the cursor if wrap is set to false
o.fillchars = { eob = " " }                   -- removing those ugly ~ in vim
o.shortmess:append "sI"
o.whichwrap:append("<>[]hl")
o.iskeyword:append("-")

