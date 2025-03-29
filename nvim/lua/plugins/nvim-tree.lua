return {
	'nvim-tree/nvim-tree.lua',

	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 45,
				signcolumn = "no",
			},
			renderer = {
				group_empty = true,
				icons = {
					webdev_colors = false,
					show = {
						file = false,
						folder = true,
						folder_arrow = false,
						git = false,
					}
				}
			},
			filters = {
				dotfiles = true,
			},

			git = {
				enable = false,
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" })
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

		vim.api.nvim_set_hl(0, "NvimTreeNormal", {
			fg = "none",
			bg = "none",
			ctermbg = "none"
		})
	end,

}
