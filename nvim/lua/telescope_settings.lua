-- Telescope Setup
local telescope_setup_status_ok, telescope = pcall(require, "telescope")
if not telescope_setup_status_ok then
  vim.notify("Error loading telescope", vim.log.levels.ERROR)
else
  -- Also safely require telescope.builtin
  local builtin_status_ok, builtin = pcall(require, "telescope.builtin")
  if not builtin_status_ok then
    vim.notify("Error loading telescope.builtin", vim.log.levels.ERROR)
  else
    telescope.setup({
      defaults = {
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }, -- Nice borders
      },
      pickers = {},
      extensions = {
        -- Configuration for Telescope extensions (like fzf-native) would go here
        fzf = {
          fuzzy = true,                             -- false will only do exact matching
          override_generic_sorter = true,           -- override the generic sorter
          override_file_sorter = true,              -- override the file sorter
          case_mode = "smart_case",                 -- "smart_case", "ignore_case", "respect_case"
        }
      },
    })

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {
      noremap = true,
      silent = true,
      desc = "[F]ind [F]iles",
    })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
      noremap = true,
      silent = true,
      desc = "[F]ind by [G]rep (Project Search)",
    })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {
      noremap = true,
      silent = true,
      desc = "[F]ind open [B]uffers",
    })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
      noremap = true,
      silent = true,
      desc = "[F]ind [H]elp Tags",
    })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {
      noremap = true,
      silent = true,
      desc = "[F]ind [O]ld Files (History)",
    })

  end
end
