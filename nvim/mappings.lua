vim.g.mapleader = " "

-- Save --
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>")

-- Split navigation --
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Buffers --
vim.keymap.set("n", "<leader>x", "<Cmd>bd<CR>")

-- Telescope Mappings --
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })

-- Neo Tree --
vim.keymap.set("n", "<C-n>", "<Cmd> Neotree toggle <CR>")
vim.keymap.set("n", "<leader>e", "<Cmd> Neotree focus <CR>")
