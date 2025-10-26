-- Basics
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.cursorline = true      -- Highlight current line
vim.opt.tabstop = 4            -- Number of spaces a tab equals
vim.opt.shiftwidth = 4         -- Number of spaces to insert for indentation
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.autoindent = true      -- Copy indent from current line when starting a new line
vim.opt.smartindent = true     -- Do smart autoindenting
vim.opt.wrap = false           -- Disable line wrap
vim.opt.swapfile = false       -- Disable swapfile
vim.opt.backup = false         -- Disable backup
vim.opt.undofile = true        -- Enable persistent undo
vim.opt.termguicolors = true   -- Enable true color support (recommended for themes)
vim.opt.hlsearch = true        -- Highlight search results
vim.opt.incsearch = true       -- Show search results incrementally
vim.opt.ignorecase = true      -- Ignore case in search patterns
vim.opt.smartcase = true       -- Override ignorecase if pattern contains uppercase letters
vim.opt.scrolloff = 14          -- Keep n lines visible above/below cursor
vim.opt.clipboard = 'unnamedplus'
vim.opt.signcolumn = 'yes'
vim.g.mapleader = " "          -- sets leader to spacebar
vim.g.maplocalleader = "\\"

-- Remapping to öäü keymaps
vim.keymap.set({ "n", "v" }, "ö", "]")
vim.keymap.set({ "n", "v" }, "ä", "[")

vim.keymap.set("n", "öm", "]m")
vim.keymap.set("n", "äm", "[m")

vim.keymap.set({ "n", "v"}, "<leader>c", '"_c')
vim.keymap.set({ "n", "v"}, "<leader>C", '"_C')
vim.keymap.set({ "n", "v"}, "<leader>d", '"_d')
vim.keymap.set({ "n", "v"}, "<leader>D", '"_D')

