-- nvim-treesitter setup
-- Use pcall to catch errors during setup

require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require('nvim-treesitter').install { 
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "java",  
      "typescript",
      "tsx",
      "html",
      "css",
      "json",
      "yaml",
      "markdown",
      "markdown_inline", -- for fenced code blocks
      "bash",
      "python",
      "rust",
      "go",
      "zig",
      "latex",
      "cpp",
      "c"
}

