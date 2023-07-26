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
  theme = "everblush",
  theme_toggle = { "everblush", "everblush" },
  lazyload = false,
}
M.mappings = require "custom.mappings"

-- require("telescope").load_extension "git_worktree"

vim.cmd "autocmd BufRead,BufEnter *.astro set filetype=astro"
vim.cmd "set rnu"
vim.cmd "autocmd InsertLeave *.tex update"

return M
