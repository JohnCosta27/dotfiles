local M = {}

M.plugins = "custom.plugins"

M.options = {
  user = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end,
}

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "everforest_light" },
  lazyload = false,
}
M.mappings = require "custom.mappings"

vim.cmd "autocmd BufRead,BufEnter *.astro set filetype=astro"
vim.cmd "set rnu"
vim.cmd "autocmd InsertLeave *.tex update"

return M
