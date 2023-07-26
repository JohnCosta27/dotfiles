return {
  { "wakatime/vim-wakatime", lazy = false },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.lspconfig"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { "windwp/nvim-ts-autotag", lazy = false },
  { "lervag/vimtex", lazy = false },
  { "sindrets/diffview.nvim", lazy = false },
  { "ThePrimeagen/harpoon" },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "sainnhe/everforest", lazy = false },
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup {
        terminals = {
          shell = vim.o.shell,
          list = {},
          type_opts = {
            float = {
              row = 0.1,
              col = 0.1,
              width = 0.8,
              height = 0.8,
              border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.3 },
            vertical = { location = "rightbelow", split_ratio = 0.5 },
          },
        },
        behavior = {
          auto_insert = true,
        },
      }
    end,
  },
}
