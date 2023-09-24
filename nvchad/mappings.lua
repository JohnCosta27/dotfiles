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

M.diffview = {
  n = {
    ["<leader>df"] = { "<cmd> DiffviewOpen <CR>", "Open git view" },
    ["<leader>dr"] = { "<cmd> DiffviewRefresh <CR>", "Open git view" },
  },
}

local lazyGitted = false

M.custom = {
  n = {
    ["<Leader>fm"] = { ":lua vim.lsp.buf.format() <CR>", "Formats the current buffer using built in LSP" },
    ["<leader>nt"] = { "<cmd> tabnew <CR>", "New tab" },
    ["<leader>ct"] = { "<cmd> tabclose <CR>", "Close tab" },
    ["<leader>rf"] = { ":lua require('refactoring').select_refactor()<CR>", "options" },
    ["<leader>q"] = { ":lua require('harpoon.mark').add_file()<CR>" },
    ["<leader>fp"] = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>" },
    ["<leader>as"] = { ":lua require('harpoon.ui').nav_next()<CR>" },
    ["<leader>sa"] = { ":lua require('harpoon.ui').nav_prev()<CR>" },

    ["<leader>lt"] = { ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>" },
    ["<leader>wt"] = { ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>" },
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
  v = {
    ["<leader>rf"] = { ":lua require('refactoring').select_refactor()<CR>", "options" },
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
}

return M
