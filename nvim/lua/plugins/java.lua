return {
    "nvim-java/nvim-java",
    lazy = false,
    priority =  500,
    init = function() 
        require("java").setup({})
    end
}
