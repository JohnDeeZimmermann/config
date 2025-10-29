return {
    "nvim-mini/mini.animate",
    opts = function()
        local animate = require('mini.animate')
        return {
            cursor = {
                timing = animate.gen_timing.linear({ duration = 70, unit = 'total' }),
            },
            scroll = {
                enabled = true,
                timing = animate.gen_timing.linear({ duration = 50, unit = 'total' }),
            },
            resize = {
                enabled = false
            },
            close = {
                enabled = false
            }
        }
    end,
    cond = function() 
        return not vim.g.neovide
    end
}
