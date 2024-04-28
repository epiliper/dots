require("eli.remap")

-- LAZY CONFIG
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

-- require("vim-options")
require("lazy").setup("plugins")

-- keymaps and misc changes 

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

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

