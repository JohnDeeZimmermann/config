return {
    'nvim-mini/mini.diff',
    version = '*',
    config = function()
        local diff = require("mini.diff")
        diff.setup({
            -- Disabled by default
            source = diff.gen_source.none(),
        })
    end,
}
