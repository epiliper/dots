-- bootstrap nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{

		"neanias/everforest-nvim",
		priority = 1000,
		lazy = false,
		version = false,
		config = function()
			vim.cmd([[colorscheme everforest]])
			require("everforest").setup({
				-- background = "medium",
				transparent_background_level = 1,
			})
		end,
	},

	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons'},
		config = function()
			require('lualine').setup()
		end,
		},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		config = function()
		local harpoon = require("harpoon")
		harpoon.setup()
		vim.keymap.set("n", "<C-t>", function() harpoon:list():append() end)
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
		end,


		},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local mason = require("mason")
			mason.setup()
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"pylsp",
					"clangd",
					"rust_analyzer"
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("cmp").setup({
				sources = {
					{ name = "nvim_lsp" },
				},
			})

			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()
			local keymap = vim.keymap
			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				opts.buffer = bufnr
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end

			local lspconfig = require("lspconfig")

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["pylsp"].setup({
				capabilites = capabilities,
				on_attach = on_attach,
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								enabled = false,
								ignore = { "E266", "W291", "E251" },
							},
						},
					},
				},
			})

			lspconfig['rust_analyzer'].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim", -- "vimdoc",
					"query",
					"python",
					"java",
					"rust"
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	{ "ms-jpq/coq_nvim" },
	{ "nvim-lua/plenary.nvim" },

	{ "nvim-tree/nvim-web-devicons",
		config = function()
			require('nvim-web-devicons').setup()
		end,
	},

	{ "tpope/vim-commentary" },

	{ "nvim-telescope/telescope.nvim" },
	{ "lukas-reineke/indent-blankline.nvim", 
		main="ibl",
		ops = {},
		config = function()
			require("ibl").setup()
		end,

	},

	{ "lukas-reineke/lsp-format.nvim" },
})

require("eli.remap")

-- require('everforest').load()

-- require('everforest').setup({
-- 	transparent_background_level = 2
-- })

vim.keymap.set("n", "<leader>y", "'+y")
vim.keymap.set("v", "<leader>y", "'+y")
vim.keymap.set("n", "<leader>Y", "'+Y")

vim.opt.number = true
vim.opt.rnu = true
vim.o.termguicolors = true

vim.cmd("hi! Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi! NonText guibg=NONE ctermbg=NONE")

vim.api.nvim_set_option("clipboard", "unnamed")

-- require("ibl").setup()
cmdheight = 0

-- telescope configuration
local builtin = require('telescope.builtin')

local actions = require('telescope.actions')
local config = require('telescope.config')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim.keymap.set('n', '<C-j>', actions.move_selection_next, {})
-- vim.keymap.set('n', '<C-k>', actions.move_selection_previous, {})
