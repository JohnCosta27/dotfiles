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
    "nvim-telescope/telescope.nvim",
    lazy = false,
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

  { "https://github.com/mfussenegger/nvim-dap", dependencies = {"rcarriga/nvim-dap-ui", "leoluz/nvim-dap-go", "nvim-neotest/nvim-nio"}, config = function ()
    local dap, dapui = require("dap"), require("dapui")

    require('dap-go').setup()
    require('dapui').setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end },

   {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
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
  {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end,
    lazy = false,
  }

}
