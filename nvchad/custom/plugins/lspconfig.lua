local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {"tailwindcss", "eslint", "cssls", "prismals", "gopls", "dockerls", "yamlls", "hls", "dafny"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end


lspconfig.dafny.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("*.dfy"),
}

lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false,
  enable = false,
}
