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
				"r",
				"bash",
				"go"
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = false },
		})
	end,
}
