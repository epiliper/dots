return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
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
				"rust",
				"markdown",
				"markdown_inline",
				"html"
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = false },
		})
	end,
}
