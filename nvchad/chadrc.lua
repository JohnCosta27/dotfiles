local M = {}
local override = require "custom.override"

M.plugins = {
  user = require "custom.plugins",
  status = {
    dashboard = true,
    alpha = true,
  },
  override = {
    ["lewis6991/gitsigns.nvim"] = {
      signcolumn = true,
    },
    ["NvChad/ui"] = {
      tabufline = {
        enabled = true,
        lazyload = true,
      },
    },
    ["williamboman/mason"] = override.mason,
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
}
M.options = {
   user = function()
      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
   end
}
M.ui = {
  theme = "everforest",
  theme_toggle = {"everforest", "everforest_light"},
  lazyload = false,
}

M.mappings = require "custom.mappings"
vim.cmd('autocmd BufRead,BufEnter *.astro set filetype=astro')

return M
