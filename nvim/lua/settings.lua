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
vim.opt.scrolloff = 20          -- Keep n lines visible above/below cursor
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
vim.keymap.set({ "n", "v"}, "x", '"_x')

-- Move lines up and down
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', { desc = 'Move line down', silent = true })
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', { desc = 'Move line up', silent = true })
vim.keymap.set('v', '<C-j>', ':m \'>+1<CR>gv=gv', { desc = 'Move selected lines down', silent = true })
vim.keymap.set('v', '<C-k>', ':m \'<-2<CR>gv=gv', { desc = 'Move selected lines up', silent = true })

-- Yank highlighting
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

-- Copy paste with normie keybinds
vim.keymap.set('n', '<D-s>', vim.cmd.w)                                  -- Save
vim.keymap.set('v', '<D-c>', '"+y', { silent = true, noremap = true })   -- Copy
vim.keymap.set('n', '<D-v>', '"+P')                                      -- Paste normal mode
vim.keymap.set('v', '<D-v>', '"+P')                                      -- Paste visual mode
vim.keymap.set('c', '<D-v>', '<C-R>+')                                   -- Paste command mode
vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli')                              -- Paste insert mode

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })
