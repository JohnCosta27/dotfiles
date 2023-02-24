local M = {}

M.formatter = {
  n = {
    ["<Leader>fq"] = {"<cmd> Neoformat<CR>", "Formatted :)"},
    ["<Leader>b"] = {"<cmd> Gitsigns toggle_current_line_blame<CR>", "Toggled line blames"},
    ["<Leader>bl"] = {"<cmd> Gitsigns blame_line<CR>", "Line blame"}
  }
}

M.nvimtree = {
  n = {
    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
    ["<leader>co"] = {"<cmd> NvimTreeCollapse <CR>", "Collapse nvimtree"},
  },
}

M.diffview = {
  n = {
    ["<leader>df"] = {"<cmd> DiffviewOpen <CR>", "Open git view"},
    ["<leader>dr"] = {"<cmd> DiffviewRefresh <CR>", "Open git view"},
  }
}

M.custom = {
  n = {
    ["<leader>nt"] = {"<cmd> tabnew <CR>", "New tab"},
    ["<leader>ct"] = {"<cmd> tabclose <CR>", "Close tab"},
    ["<leader>rf"] = {":lua require('refactoring').select_refactor()<CR>", "options"},
    ["<leader>q"] = {":lua require('harpoon.mark').add_file()<CR>"},
    ["<leader>fm"] = {":lua require('harpoon.ui').toggle_quick_menu()<CR>"},
  },
  v = {
    ["<leader>rf"] = {":lua require('refactoring').select_refactor()<CR>", "options"},
  }
}

return M
