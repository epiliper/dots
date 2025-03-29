plugins = {

	{ 'LukeGoodsell/nextflow-vim' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'rafamadriz/friendly-snippets' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'dstein64/vim-startuptime' },
	{ "tpope/vim-commentary" },
	{ "lukas-reineke/lsp-format.nvim" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	}
}

return plugins
