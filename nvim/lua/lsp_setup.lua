-- Mason Setup (LSP Installer)
local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  vim.notify("Error loading mason", vim.log.levels.ERROR)
else
  local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_status_ok then
    vim.notify("Error loading mason-lspconfig", vim.log.levels.ERROR)
  else
    mason.setup({})

    mason_lspconfig.setup({
      -- A list of servers to automatically install if they're not already installed.
      -- Add any servers you commonly use here. Find names using :Mason
      -- Example:
      ensure_installed = {
        "lua_ls", -- For Lua
        "ts_ls",  -- For TypeScript/JavaScript
        "html",   -- For HTML
        "cssls",  -- For CSS
        "jsonls", -- For JSON
        "zls",    -- For ZIG
        "texlab", -- For LaTeX
        "jdtls",  -- For Java
        "clangd", -- For C/C++
      },
      -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
      -- This setting has no relation with the `ensure_installed` setting.
      -- Can be: "automatic", "prompt", false
      automatic_installation = true,
    })
  end
end


-- LSP Configuration (nvim-lspconfig)
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  vim.notify("Error loading lspconfig", vim.log.levels.ERROR)
else
  local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not cmp_nvim_lsp_status_ok then
    vim.notify("Error loading cmp_nvim_lsp", vim.log.levels.ERROR)
  else
    -- Setup language servers.
    local servers = require("mason-lspconfig").get_installed_servers() -- Get list from mason

    -- Function to run when LSP attaches to a buffer
    local on_attach = function(client, bufnr)
      vim.notify("LSP attached: " .. client.name, vim.log.levels.INFO, { title = "LSP" })
      -- Enable completion triggered by <c-x><c-o>
      -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') -- Handled by nvim-cmp

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts) -- Use Ctrl-k for signature help
      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<leader>p', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>ft', function()
        vim.lsp.buf.format({ async = true })
      end, opts) -- Format code
      -- Example for init.lua

      -- Diagnostics keymaps
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

      -- Set highlight group for undercurls
      vim.cmd [[ highlight LspDiagnosticsSignError guifg=Red gui=bold ]]
      vim.cmd [[ highlight LspDiagnosticsSignWarning guifg=Yellow gui=bold ]]
      vim.cmd [[ highlight LspDiagnosticsSignInformation guifg=Blue gui=bold ]]
      vim.cmd [[ highlight LspDiagnosticsSignHint guifg=Cyan gui=bold ]]

      if client.server_capabilities.inlayHintProvider then
         vim.lsp.inlay_hint.enable(true)
       end
    end

    -- Configure LSP capabilities. This tells the LSP server which features the client supports.
    -- Get capabilities from nvim-cmp
    local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Loop through the servers installed by Mason and configure them with nvim-lspconfig
    for _, server_name in ipairs(servers) do
      local config = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      if server_name == "clangd" then
        config.cmd = {
          "clangd",
          "--query-driver=/opt/jdz/zig++"
        }
      end

      lspconfig[server_name].setup(config)
    end
  end
end

vim.diagnostic.config({
  update_in_insert = true,
})

-- Completion Engine Setup (nvim-cmp)
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  vim.notify("Error loading nvim-cmp", vim.log.levels.ERROR)
else
  local cmp_types = require('cmp.types') -- For mapping configuration

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      -- Uncomment the following lines if you installed LuaSnip
      -- expand = function(args)
      --   require('luasnip').lsp_expand(args.body)
      -- end,
    },
    window = {
      -- Optional: Add borders to completion and documentation windows
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),            -- Trigger completion
      ['<C-e>'] = cmp.mapping.abort(),                   -- Close completion window
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected suggestion
      -- Navigate suggestions
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
          -- You could tabby completion here if you have it installed
          -- elseif require('luasnip').expand_or_jumpable() then
          --   require('luasnip').expand_or_jump()
        else
          fallback()      -- Fallback to default Tab behavior
        end
      end, { "i", "s" }), -- i = insert mode, s = select mode
    }),
    -- Sources for completion
    sources = cmp.config.sources({
      { name = 'nvim_lsp' }, -- Source for LSP suggestions
      -- { name = 'luasnip' }, -- Source for snippets (uncomment if LuaSnip is installed)
      { name = 'buffer' },   -- Source for text in current buffer
      { name = 'path' },     -- Source for file paths
    }),
    -- Optional: Configure appearance (requires nerd font for icons)
    -- formatting = {
    --   format = require('lspkind').cmp_format({
    --     mode = 'symbol_text', -- show only symbol annotations
    --     maxwidth = 50, -- prevent the popup from becoming too wide
    --     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
    --     -- Show source name for each completion item
    --     -- before = function (entry, vim_item)
    --     --   vim_item.menu = "["..string.upper(entry.source.name).."]"
    --     --   return vim_item
    --     -- end
    --   })
    -- },
  })

  -- Set up completion for command line
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

end
