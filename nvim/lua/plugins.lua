-- Ensure vim-plug is installed
local plug_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/vim-plug'
local plug_vim = plug_path .. '/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_vim)) > 0 then
  vim.fn.system({
    'curl',
    '-fLo',
    plug_vim,
    '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
  })
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

-- Plug configuration
vim.call('plug#begin', vim.fn.stdpath('data') .. '/plugged')

-- Declare plugins using vim.cmd
vim.cmd [[ Plug 'nvim-tree/nvim-tree.lua' ]]
vim.cmd [[ Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } ]]
vim.cmd [[ Plug 'folke/tokyonight.nvim' ]]
vim.cmd [[ Plug 'nvim-mini/mini.animate' ]]
vim.cmd [[ Plug 'nvim-lua/plenary.nvim' ]]                             -- Dependency for Telescope
vim.cmd [[ Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' } ]] -- Telescope itself
vim.cmd [[ Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' } ]]    -- Harpoon for bookmarks
vim.cmd [[ Plug 'm4xshen/autoclose.nvim' ]]

-- LSP & Completion PlugInstall
vim.cmd [[ Plug 'neovim/nvim-lspconfig' ]]             -- Core LSP configuration helper
vim.cmd [[ Plug 'supermaven-inc/supermaven-nvim' ]]
vim.cmd [[ Plug 'williamboman/mason.nvim' ]]           -- LSP installer/manager
vim.cmd [[ Plug 'williamboman/mason-lspconfig.nvim' ]] -- Bridge mason & lspconfig
vim.cmd [[ Plug 'hrsh7th/nvim-cmp' ]]                  -- Completion engine
vim.cmd [[ Plug 'hrsh7th/cmp-nvim-lsp' ]]              -- LSP completion source for nvim-cmp
vim.cmd [[ Plug 'hrsh7th/cmp-buffer' ]]                -- Buffer text completion source
vim.cmd [[ Plug 'hrsh7th/cmp-path' ]]                  -- File path completion source
vim.cmd [[ Plug 'hrsh7th/cmp-cmdline' ]]               -- Command line completion source
vim.cmd [[ Plug 'f-person/auto-dark-mode.nvim']]

-- Themes
vim.cmd [[ Plug 'catppuccin/nvim', { 'as': 'catppuccin' } ]]
vim.cmd [[ Plug 'gruvbox-community/gruvbox' ]]
vim.cmd [[ Plug 'projekt0n/github-nvim-theme' ]]

-- Finish plugin declaration
vim.call('plug#end')
