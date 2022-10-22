local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer, please close and reopen Neovim ..")
    vim.cmd("packadd packer.nvim")
end

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerSync
    augroup end
]])

local ok, packer = pcall(require, "packer")
if not ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
    git = { clone_timeout = 300 },
})

-- Install plugins here
return packer.startup(function(use)
    use { "wbthomason/packer.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "windwp/nvim-autopairs" }
    use { "numToStr/Comment.nvim" }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "kyazdani42/nvim-tree.lua" }
    use { "akinsho/bufferline.nvim" }
    use { "moll/vim-bbye" }
    use { "nvim-lualine/lualine.nvim" }
    use { "ahmedkhalf/project.nvim" }
    use { "lewis6991/impatient.nvim" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "kylechui/nvim-surround" }

    -- Completion
    use { "hrsh7th/nvim-cmp" } -- The completion plugin
    use { "hrsh7th/cmp-buffer" } -- buffer completions
    use { "hrsh7th/cmp-path" } -- path completions
    use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }

    -- Colorschemes
    use { "folke/tokyonight.nvim" }

    -- Snippets
    use { "L3MON4D3/LuaSnip" } -- snippet engine
    use { "rafamadriz/friendly-snippets" } -- collection of snippets (community driven)

    -- LSP
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "neovim/nvim-lspconfig" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use { "RRethy/vim-illuminate" }

    -- Telescope
    use { "nvim-telescope/telescope.nvim" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter" }

    -- Git
    use { "lewis6991/gitsigns.nvim" }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
