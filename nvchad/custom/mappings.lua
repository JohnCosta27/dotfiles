local M = {}

M.formatter = {
  n = {
    ["<Leader>b"] = { "<cmd> Gitsigns toggle_current_line_blame<CR>", "Toggled line blames" },
    ["<Leader>bl"] = { "<cmd> Gitsigns blame_line<CR>", "Line blame" },
  },
}

M.nvimtree = {
  n = {
    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
    ["<leader>co"] = { "<cmd> NvimTreeCollapse <CR>", "Collapse nvimtree" },
  },
}

local lazyGitted = false

M.custom = {
  n = {
    ["<Leader>fm"] = { ":lua vim.lsp.buf.format() <CR>", "Formats the current buffer using built in LSP" },
    ["<leader>nt"] = { "<cmd> tabnew <CR>", "New tab" },
    ["<leader>ct"] = { "<cmd> tabclose <CR>", "Close tab" },
    ["<leader>rfr"] = { ":lua require('refactoring').select_refactor()<CR>", "options" },
    ["<leader>q"] = { ":lua require('harpoon.mark').add_file()<CR>" },
    ["<leader>fp"] = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>" },
    ["<leader>as"] = { ":lua require('harpoon.ui').nav_next()<CR>" },
    ["<leader>sa"] = { ":lua require('harpoon.ui').nav_prev()<CR>" },

    ["<leader>dr"] = { ":lua require('dapui').open({ reset = true})<CR>" },

    ["<C-l>"] = {":TmuxNavigateRight<CR>"},
    ["<C-h>"] = {":TmuxNavigateLeft<CR>"},
    ["<C-j>"] = {":TmuxNavigateDown<CR>"},
    ["<C-k>"] = {":TmuxNavigateUp<CR>"},

    ["<leader>gr"] = { ":lua require('telescope.builtin').lsp_references()<CR>" },

    ["<A-k>"] = {
      function()
        if lazyGitted then
          require("nvterm.terminal").toggle "float"
          vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber"
        else
          lazyGitted = true
          local term = require("nvterm.terminal").new "float"
          -- Work around to get lazygit to work.
          vim.api.nvim_chan_send(term.job_id, "lazygit\n")
        end
      end,
      "Toggle floating terminal",
    },
  },
  t = {
    ["<A-k>"] = {
      function()
        if lazyGitted then
          require("nvterm.terminal").toggle "float"
        else
          lazyGitted = true
          require("nvterm.terminal").toggle "float"
        end
      end,
      "Toggle floating terminal",
    },
  },
  v = {
    ["<leader>rr"] = { ":lua require('refactoring').select_refactor()<CR>", "options" },
  }
}

return M
