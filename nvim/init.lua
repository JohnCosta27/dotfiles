require("./mappings")
require("./lazy")

-- Guard (Linters + Formatters)
vim.g.guard_config = {
	fmt_on_save = true,
	lsp_as_default_formatter = true,
	save_on_fmt = true,
}

-- Sync system clipboard and neovim register
vim.opt.clipboard = { "unnamedplus" }
