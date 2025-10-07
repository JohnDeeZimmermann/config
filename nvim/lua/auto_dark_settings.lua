require('auto-dark-mode').setup({
    update_interval = 1000,
    fallback = "dark", -- or "light"

    set_dark_mode = function()
      vim.cmd('colorscheme catppuccin-macchiato')
    end,

    -- Override the default function for when light mode is detected
    set_light_mode = function()
      vim.cmd('colorscheme catppuccin-frappe')
    end,
  })
  -- Initialize auto-dark-mode.nvim
  require('auto-dark-mode').init()
