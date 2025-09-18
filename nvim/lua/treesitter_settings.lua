-- nvim-treesitter setup
-- Use pcall to catch errors during setup
local treesitter_configs_status_ok, treesitter_configs = pcall(
  require,
  "nvim-treesitter.configs"
)
if not treesitter_configs_status_ok then
  vim.notify("Error loading nvim-treesitter configs", vim.log.levels.ERROR)
else
  treesitter_configs.setup({
    -- Add languages to be installed here that you want installed on startup
    ensure_installed = {
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
      -- Add other languages you commonly use
    },
    -- Autoinstall languages that are not installed. Defaults to false (don't autoinstall)
    -- Setting to true is convenient but can slow down startup if many are missing.
    auto_install = true,

    highlight = {
      enable = true,              -- false will disable the whole extension
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false, -- Usually set to false
    },
    indent = {
      enable = true, -- Enable Tree-sitter based indentation
    },
    -- Optional: Add other modules like incremental selection, etc.
    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = '<c-space>',
    --     node_incremental = '<c-space>',
    --     scope_incremental = '<c-s>',
    --     node_decremental = '<M-space>',
    --   },
    -- },
  })
  vim.notify("Nvim-treesitter setup complete", vim.log.levels.INFO) -- Confirmation
end
