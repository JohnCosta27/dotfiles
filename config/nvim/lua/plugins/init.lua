return {
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt", lsp_format = "fallback" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					python = { "ruff_format" },
				},
				format_on_save = {
					lsp_format = "fallback",
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_background = "hard"
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				modules = {},
				ignore_install = {},
				auto_install = true,
				ensure_installed = { "lua", "javascript", "typescript", "html", "tsx", "zig" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("window-picker").setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
				},
				close_if_last_window = false,
			})
			vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lsp = require("lspconfig")

			local clients = { "vtsls", "zls", "gopls", "tailwindcss", "ocamllsp", "svelte", "biome", "pylsp", "svelte" }

			for _, value in pairs(clients) do
				lsp[value].setup({})
			end

			lsp.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim", "require" } },
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})

			lsp.rust_analyzer.setup({
				diagnostic = {
					-- Prevents the annoying popup for cancalled requests
					refreshSupport = false,
				},
			})
		end,
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		opts = {
			keymap = { preset = "enter" },

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = { documentation = { auto_show = false } },

			sources = {
				default = { "lsp", "path", "snippets" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
