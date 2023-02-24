return {
  ["wakatime/vim-wakatime"] = {},
  ["sbdchd/neoformat"] = {},
  ["williamboman/mason-lspconfig.nvim"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end
  },
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact", "typescriptreact", "astro"},
    after = "nvim-treesitter",
    config = function()
      local present, autotag = pcall(require, "nvim-ts-autotag")

      if present then
        autotag.setup()
      end
    end
  },
  ["lervag/vimtex"] = {},
  ["sindrets/diffview.nvim"] = {},
}
