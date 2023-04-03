local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "tsserver", "tailwindcss", "cssls", "prismals", "gopls", "yamlls", "hls" }

local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_action = null_ls.builtins.code_actions

local sources = {
  formatting.prettierd,
  formatting.stylua,

  diagnostics.eslint_d,

  code_action.eslint_d,
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    -- client.resolved_capabilities.document_formatting = false
  end,
}

null_ls.setup {
  debug = true,
  sources = sources,

  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
    end
  end,
}
