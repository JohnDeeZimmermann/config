-- File navigation for related files (TS/HTML/CSS)
-- Function to get the base filename without extension
local function get_base_filename(filepath)
    local filename = vim.fn.fnamemodify(filepath, ":t:r:r")
    return filename
end

-- Function to check if a file exists in the same directory
local function file_exists(filename)
    local stat = vim.loop.fs_stat(filename)
    return stat ~= nil
end

-- Function to open related file
local function open_related_file(extension)
    local current_file = vim.api.nvim_buf_get_name(0)
    local base_name = get_base_filename(current_file)
    local dir = vim.fn.fnamemodify(current_file, ":h")

    -- Try different CSS file variations
    if extension == "css" then
        -- Check for name.module.css first, then name.css
        local module_css = dir .. "/" .. base_name .. ".module.css"
        local regular_css = dir .. "/" .. base_name .. ".css"

        if file_exists(module_css) then
            vim.cmd("edit " .. module_css)
            return true
        elseif file_exists(regular_css) then
            vim.cmd("edit " .. regular_css)
            return true
        else
            vim.notify("No CSS file found for " .. base_name, vim.log.levels.WARN)
            return false
        end
    else
        -- For HTML and TS files
        local target_file = dir .. "/" .. base_name .. "." .. extension
        if file_exists(target_file) then
            vim.cmd("edit " .. target_file)
            return true
        else
            vim.notify("No " .. extension .. " file found for " .. base_name, vim.log.levels.WARN)
            return false
        end
    end
end

-- Create a function to set up the keymaps
local function setup_file_navigation()
    -- Only set up keymaps for TS, HTML, and CSS files
    local filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "html", "css" }

    vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function()
            local opts = { noremap = true, silent = true, desc = "Navigate to related file" }

            -- CSS navigation (leader h c)
            vim.keymap.set("n", "<leader>hc", function()
                open_related_file("css")
            end, opts)

            -- HTML navigation (leader h h)
            vim.keymap.set("n", "<leader>hh", function()
                open_related_file("html")
            end, opts)

            -- TypeScript navigation (leader h t)
            vim.keymap.set("n", "<leader>ht", function()
                open_related_file("ts")
            end, opts)

            -- Also check for .tsx files
            vim.keymap.set("n", "<leader>hx", function()
                open_related_file("tsx")
            end, opts)
        end,
    })
end

-- Set up the navigation
setup_file_navigation()
