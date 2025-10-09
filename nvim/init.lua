-- ~/.config/nvim/init.lua
require("settings")
require("plugins")

-- PLUGIN SETTINGS FOLLOWING (Load AFTER plug#end)
vim.cmd('colorscheme github_dark')

require("nvim_tree_settings")
require("treesitter_settings")
require("telescope_settings")
require("harpoon_settings")
require("lsp_setup")
require("supermaven_settings")
require("auto_dark_settings")
require("mini-animate_settings")
require("autoclose_settings")

-- Autocommand to reload init.lua on save
-- Use a group to prevent duplicate autocommands on reload
vim.api.nvim_create_augroup('NvimConfigReload', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  group = 'NvimConfigReload',
  pattern = vim.fn.stdpath('config') .. "/init.lua",   -- Use stdpath for config
  callback = function()
    -- Use pcall to catch errors during source
    local status_ok, _ = pcall(vim.cmd, 'source %')
    if status_ok then
      vim.notify("init.lua reloaded successfully!", vim.log.levels.INFO)
    else
      vim.notify(
        "Error reloading init.lua. Check messages.",
        vim.log.levels.ERROR
      )
    end
  end,
})

