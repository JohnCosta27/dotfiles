-- Leader
vim.g.mapleader = " "

-- Guard (Linters + Formatters)
vim.g.guard_config = {
	fmt_on_save = true,
	lsp_as_default_formatter = true,
	save_on_fmt = true,
}

-- Sync system clipboard and neovim register
vim.opt.clipboard = { "unnamedplus" }

-- Save undo history
vim.opt.undofile = true
--
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Remove sign column (LSP gutter on the left)
vim.opt.signcolumn = "yes"

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Modules --

-- Lazy = Package Manager --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Mappings

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
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope live buffers" })

-- Neo Tree --
vim.keymap.set("n", "<C-n>", "<Cmd> Neotree toggle <CR>")
vim.keymap.set("n", "<leader>e", "<Cmd> Neotree focus <CR>")

-- LSP --
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>lf", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)

-- Search --
vim.keymap.set("n", "<ESC>", "<Cmd> noh <CR>")

-- Tmux navigator --
vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>")

-- Floating Terminal --
vim.keymap.set("n", "<A-k>", "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set("t", "<A-k>", "<cmd>ToggleTerm direction=float<cr>")
