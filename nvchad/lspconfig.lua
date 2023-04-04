local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "tsserver", "tailwindcss", "cssls", "prismals", "gopls", "yamlls", "hls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}

