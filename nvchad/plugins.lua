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
    "JohnCosta27/git-worktree.nvim",
    config = function()
      local Worktree = require "git-worktree"

      -- op = Operations.Switch, Operations.Create, Operations.Delete
      -- metadata = table of useful values (structure dependent on op)
      --      Switch
      --          path = path you switched to
      --          prev_path = previous worktree path
      --      Create
      --          path = path where worktree created
      --          branch = branch name
      --          upstream = upstream remote name
      --      Delete
      --          path = path where worktree deleted

      Worktree.on_tree_change(function(op, metadata)
        if op ~= Worktree.Operations.Delete then
          -- os.execute()
        end
      end)
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
}
