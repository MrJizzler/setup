local on_attach = function(client, bufnr)
  -- Suppress virtual text.
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = true,
    -- delay update diagnostics
    update_in_insert = false,
  })
  require("plugins.configs.lspconfig").on_attach(client, bufnr)
end

local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "clangd", "lua_ls", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
