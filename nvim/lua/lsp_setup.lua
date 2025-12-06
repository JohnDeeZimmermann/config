-- Mason Setup
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "vtsls",
        "html",
        "cssls",
        "jsonls",
        "zls",
        "texlab",
        "clangd",
        "basedpyright",
        "rust_analyzer",
    },
    automatic_installation = true,
})

-- LSP keymaps
local opts = { buffer = bufnr, noremap = true, silent = true }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<leader>gh', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set({ 'n', 'i' }, '<C-p>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set('n', '<D-p>', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<leader>ft', function()
    vim.lsp.buf.format({ async = true })
end, opts)

-- Diagnostics keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'gh', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Diagnostic highlights
vim.cmd [[ highlight LspDiagnosticsSignError guifg=Red gui=bold ]]
vim.cmd [[ highlight LspDiagnosticsSignWarning guifg=Yellow gui=bold ]]
vim.cmd [[ highlight LspDiagnosticsSignInformation guifg=Blue gui=bold ]]
vim.cmd [[ highlight LspDiagnosticsSignHint guifg=Cyan gui=bold ]]

-- Modern LSP setup using vim.lsp.config
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
    end
end

-- Configure root patterns for different languages
vim.lsp.config("*", {
    capabilities = capabilities,
    on_attach = on_attach,
})

local servers = require("mason-lspconfig").get_installed_servers()

for _, server_name in ipairs(servers) do
    if server_name == "clangd" then
        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--query-driver=/opt/jdz/zig++"
            }
        })
    end

    vim.lsp.enable(server_name)
end

vim.diagnostic.config({
    update_in_insert = true,
})

-- nvim-cmp setup
local cmp = require("cmp")
local cmp_types = require('cmp.types')

cmp.setup({
    snippet = {},
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<D-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter confirms and selects first item by default
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }),
    -- preselect = cmp.PreselectMode.Item, -- Select first item by default
})

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
