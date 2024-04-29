plugins = {

	{'saadparwaiz1/cmp_luasnip'},
	{'rafamadriz/friendly-snippets'},
	{'L3MON4D3/LuaSnip'},

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

	{ "rcarriga/nvim-dap-ui",
	dependencies = {
			'nvim-neotest/nvim-nio'
		},
	},

 	{
 		"neanias/everforest-nvim",
 		priority = 1000,
 		lazy = false,
 		version = false,
 		config = function()
 			vim.cmd([[colorscheme everforest]])
 			require("everforest").setup({
 				background = "medium",
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
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
		ft = { "markdown"},
		build = function() vim.fn["mkdp#util#install"]() end,

		},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
}

return plugins
