return {
  ["wakatime/vim-wakatime"] = {},
  ["sbdchd/neoformat"] = {},
  ["williamboman/mason-lspconfig.nvim"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end
  }
}
