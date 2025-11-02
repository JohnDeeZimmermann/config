local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Retrieving harpoons
local shift_buttons = "!@#$%^&*()"
for i = 1, 8 do
    vim.keymap.set("n", "<C-" .. i .. ">", function() harpoon:list():select(i) end)
    vim.keymap.set("n", "<leader>h" .. i, function() harpoon:list():select(i) end)

    vim.keymap.set("n", "<C-" .. shift_buttons:sub(i,i) .. ">", function()
        harpoon:list():replace_at(i)
    end)
    vim.keymap.set("n", "<leader>hs" .. i, function()
        harpoon:list():replace_at(i)
    end)
end

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
