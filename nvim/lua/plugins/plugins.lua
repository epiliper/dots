plugins = {

	{'LukeGoodsell/nextflow-vim'},
	{'norcalli/nvim-colorizer.lua', 
},
	{'preservim/vim-pencil',
},

	{'folke/zen-mode.nvim',
}, 

	{'saadparwaiz1/cmp_luasnip'},
	{'rafamadriz/friendly-snippets'},
	{'L3MON4D3/LuaSnip'},

	{'lewis6991/gitsigns.nvim', 

	config = function()

		require('gitsigns').setup({
			sign_priority=100,
		})
	end
},

	{'dstein64/vim-startuptime'},

	{
		'sainnhe/gruvbox-material',
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = false
			vim.cmd.colorscheme('gruvbox-material')
		end
	},

	{ "nvim-lua/plenary.nvim",
	},

	{ "nvim-tree/nvim-web-devicons",
		config = function()
			require('nvim-web-devicons').setup()
		end,
	},

	{ "tpope/vim-commentary" },

	{ "nvim-telescope/telescope.nvim",
	},

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
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons'},
		config = function()
			require('lualine').setup({
				-- options = {
				-- 	theme = "paradise",
				-- }
			})
		end,
		},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
		ft = { "markdown"},
		lazy = true,
		build = function() vim.fn["mkdp#util#install"]() end,

		},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}

return plugins
