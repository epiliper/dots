plugins = {
	{
		"echasnovski/mini.icons",
		opts = {},
		lazy = true,
		specs = {
			{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				-- needed since it will be false when loading and mini will fail
				package.loaded["nvim-web-devicons"] = {}
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},

	{
		'kylechui/nvim-surround',
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	{
		'fasterius/simple-zoom.nvim',
		config = true,
	},

	{ 'LukeGoodsell/nextflow-vim' },
	{ 'norcalli/nvim-colorizer.lua',
	},
	{ 'preservim/vim-pencil',
	},

	{
		'folke/zen-mode.nvim',
		config = function()
			local zen = require("zen-mode")

			zen.setup({
				plugins = {
					alacritty = {
						enabled = true,
						font = "15"
					}
				}
			})
			vim.keymap.set('n', '<leader>z', zen.toggle, { silent = true })
		end,
	},

	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'rafamadriz/friendly-snippets' },
	{ 'L3MON4D3/LuaSnip' },

	{
		'lewis6991/gitsigns.nvim',

		config = function()
			require('gitsigns').setup({
				sign_priority = 100,
			})
		end
	},

	{ 'dstein64/vim-startuptime' },

	{
		'sainnhe/everforest',
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = true
			vim.cmd.colorscheme('everforest')
		end
	},

	{ "nvim-lua/plenary.nvim",
	},

	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require('nvim-web-devicons').setup()
		end,
	},

	{ "tpope/vim-commentary" },


	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		ops = {},
		config = function()
			require("ibl").setup()
		end,

	},

	{ "lukas-reineke/lsp-format.nvim" },

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			'nvim-neotest/nvim-nio'
		},
	},

	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup({
				-- options = {
				-- 	theme = "paradise",
				-- }
			})
		end,
	},

	{
		-- Install markdown preview, use npx if available.
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function(plugin)
			if vim.fn.executable "npx" then
				vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
			else
				vim.cmd [[Lazy load markdown-preview.nvim]]
				vim.fn["mkdp#util#install"]()
			end
		end,
		init = function()
			if vim.fn.executable "npx" then vim.g.mkdp_filetypes = { "markdown" } end
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}

return plugins
