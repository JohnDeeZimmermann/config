-- nvim-tree setup
-- Keymaps
vim.keymap.set('n', '<leader><space>', ':NvimTreeToggle<CR>', {
  noremap = true,
  silent = true,
  desc = "Toggle NvimTree file explorer",
})
vim.keymap.set('n', '<leader>t', ':NvimTreeFocus<CR>', {
  noremap = true,
  silent = true,
  desc = "Focus NvimTree file explorer",
})

-- Use pcall to catch errors during setup
local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
  vim.notify("Error loading nvim-tree", vim.log.levels.ERROR)
else
  nvim_tree.setup({
    git = {
      enable = true,
    },
    view = {
      width = 50,       -- Set the width of the tree 
      side = "right"
    },
    renderer = {
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,           -- Requires nvim-web-devicons (add as plugin if desired)
        },
        glyphs = {
          folder = {
            arrow_closed = "▸", -- Arrow when folder is closed
            arrow_open = "▾", -- Arrow when folder is open
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "🗑",
            ignored = "◌",
          },
        },
      },
    },
    -- Disable netrw when nvim-tree is active
    disable_netrw = true,
    hijack_netrw = true,
  })
end
