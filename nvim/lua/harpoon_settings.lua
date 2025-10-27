local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Retrieving harpoons
vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<C-5>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<C-6>", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<C-7>", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<C-8>", function() harpoon:list():select(8) end)

-- Harpooning at specific index
vim.keymap.set("n", "<C-!>", function() harpoon:list():replace_at(1) end)
vim.keymap.set("n", "<C-@>", function() harpoon:list():replace_at(2) end)
vim.keymap.set("n", "<C-#>", function() harpoon:list():replace_at(3) end)
vim.keymap.set("n", "<C-$>", function() harpoon:list():replace_at(4) end)
vim.keymap.set("n", "<C-%>", function() harpoon:list():replace_at(5) end)
vim.keymap.set("n", "<C-^>", function() harpoon:list():replace_at(6) end)
vim.keymap.set("n", "<C-&>", function() harpoon:list():replace_at(7) end)
vim.keymap.set("n", "<C-*>", function() harpoon:list():replace_at(8) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- Copy paste with normie keybinds
  vim.keymap.set('n', '<D-s>', vim.cmd.w)                                -- Save 
  vim.keymap.set('v', '<D-c>', '"+y', { silent = true, noremap = true }) -- Copy
  vim.keymap.set('n', '<D-v>', '"+P')                                    -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P')                                    -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+')                                 -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli')                            -- Paste insert mode

  -- Allow clipboard copy paste in neovim
  vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })
