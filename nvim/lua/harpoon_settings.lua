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
vim.keymap.set("n", "<C-S-1>", function() harpoon:list():replace_at(1) end)
vim.keymap.set("n", "<C-S-2>", function() harpoon:list():replace_at(2) end)
vim.keymap.set("n", "<C-S-3>", function() harpoon:list():replace_at(3) end)
vim.keymap.set("n", "<C-S-4>", function() harpoon:list():replace_at(4) end)
vim.keymap.set("n", "<C-S-5>", function() harpoon:list():replace_at(5) end)
vim.keymap.set("n", "<C-S-6>", function() harpoon:list():replace_at(6) end)
vim.keymap.set("n", "<C-S-7>", function() harpoon:list():replace_at(7) end)
vim.keymap.set("n", "<C-S-8>", function() harpoon:list():replace_at(8) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
