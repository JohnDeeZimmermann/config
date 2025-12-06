-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { "nvim-tree/nvim-tree.lua" },
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-lua/plenary.nvim",              lazy = false,        priority = 10000 },
        { "nvim-telescope/telescope.nvim" },
        { import = 'plugins.treesitter' },
        { "ThePrimeagen/harpoon",               branch = "harpoon2", },
        { "m4xshen/autoclose.nvim" },
        { "lervag/vimtex",                      lazy = false },
        { "norcalli/nvim-colorizer.lua" },
        { "lukas-reineke/indent-blankline.nvim" },
        { "saghen/blink.cmp",                   version = '1.*',     lazy = false,    enabled = false },
        { import = 'plugins.lazygit' },
        { import = 'plugins.mini-animate' },
        { import = 'plugins.mini-diff' },
        -- { "olimorris/codecompanion.nvim" },

        -- LSP & Completion PluginInstall
        { import = "plugins.java" },
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { 'supermaven-inc/supermaven-nvim' },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "f-person/auto-dark-mode.nvim" },
        { "windwp/nvim-ts-autotag" },
        { "OXY2DEV/markview.nvim",              lazy = false },

        { import = "plugins.themes" },
        { import = "plugins.codecompanion" }
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "catppuccin-macchiato" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
