-- ~/.config/nvim/init.lua
require("settings")
require("lazy_setup")

-- PLUGIN SETTINGS FOLLOWING (Load AFTER plug#end)
vim.cmd('colorscheme catppuccin-macchiato')

require("nvim_tree_settings")
require("treesitter_settings")
require("telescope_settings")
require("harpoon_settings")
require("lsp_setup")
require("supermaven_settings")
require("auto_dark_settings")
require("autoclose_settings")
require("neovide_settings")
require("code_companion_settings")
require("small_plugins")
require("blink_settings")

