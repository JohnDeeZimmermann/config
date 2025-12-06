return {
    "olimorris/codecompanion.nvim",
    opts = {
        adapters = {
            http = {
                openrouter = function()
                    local openrouter = require("utils.openrouter")
                    return require("codecompanion.adapters").extend(openrouter, {
                        name = "openrouter",
                        formatted_name = "Open Router",
                        env = {
                            url = "https://openrouter.ai/api",
                            api_key = "cmd:echo $NVIM_CC_API_KEY",
                        },
                        schema = {
                            model = {
                                default = "z-ai/glm-4.6",
                            },
                        },
                    })
                end,
            },
        },
        strategies = {
            inline = {
                keymaps = {
                    accept_change = {
                        modes = { n = "ga" },
                        description = "Accept the suggested change",
                    },
                    reject_change = {
                        modes = { n = "gr" },
                        opts = { nowait = true },
                        description = "Reject the suggested change",
                    },
                },
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
