return {
    -- Themes
    { "catppuccin/nvim" },
    { "gruvbox-community/gruvbox" },
    { "projekt0n/github-nvim-theme" },
    { "folke/tokyonight.nvim" },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false,
        opts = {
            theme = "tokyonight"
        }
    }
}
