-- nvim-tree setup

-- Highlighting the current buffer
local api = require("nvim-tree.api")
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if (vim.fn.bufname() == "NvimTree_1") then return end

        api.tree.find_file({ buf = vim.fn.bufnr() })
    end,
})

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
            width = 100, -- Set the width of the tree
            side = "right"
        },
        renderer = {
            special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
            highlight_modified = "all",
            decorators = { "Git", "Open", "Hidden", "Modified", "Bookmark", "Diagnostics", "Copied", "Cut", },
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true, -- Requires nvim-web-devicons (add as plugin if desired)
                    modified = true,
                },
                glyphs = {
                    modified = "●",
                    folder = {
                        arrow_closed = "▸", -- Arrow when folder is closed
                        arrow_open = "▾", -- Arrow when folder is open
                    },
                    git = {
                        unstaged = "✏️",
                        staged = "✓",
                        unmerged = "",
                        renamed = "✏️ [R]",
                        untracked = "⚠️",
                        deleted = "~",
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
