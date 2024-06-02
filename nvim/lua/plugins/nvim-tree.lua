return { 'nvim-tree/nvim-tree.lua',

	config = function()


	require("nvim-tree").setup({
	  sort = {
	    sorter = "case_sensitive",
	  },
	  view = {
	    width = 45,
	  },
	  renderer = {
	    group_empty = true,
	  },
	  filters = {
	    dotfiles = true,
	  },
	})
	
	local keymap = vim.keymap

	keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) 
        keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
        keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
        keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

	vim.api.nvim_set_hl(0, "NvimTreeNormal", {
			fg = "none",
			bg = "none",
			ctermbg = "none"
		})

	end,

}
