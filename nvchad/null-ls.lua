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

null_ls.setup {
  debug = true,
  sources = sources,

  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
    end
  end,
}
