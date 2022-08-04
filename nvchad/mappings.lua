local M = {}

M.formatter = {
  n = {
    ["<Leader>fq"] = {"<cmd> Neoformat<CR>", "Formatted :)"},
    ["<Leader>b"] = {"<cmd> Gitsigns toggle_current_line_blame<CR>", "Toggled line blames"},
    ["<Leader>bl"] = {"<cmd> Gitsigns blame_line<CR>", "Line blame"}
  }
}

return M
