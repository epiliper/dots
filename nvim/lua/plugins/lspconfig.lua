local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

return  {
"neovim/nvim-lspconfig",
config = function()
	cmp = require("cmp")
	luasnip = require('luasnip')
	require('luasnip.loaders.from_vscode').lazy_load()
	-- require("cmp").setup({
	cmp.setup({
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		},
		window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		snippet = {
				expand = function(args) 
					require("luasnip").lsp_expand(args.body)
				end,
			},
		 mapping = cmp.mapping.preset.insert({
		      ['<C-k>'] = cmp.mapping.select_prev_item(),
		      ['<C-j>'] = cmp.mapping.select_next_item(),
		      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		      ['<C-f>'] = cmp.mapping.scroll_docs(4),
		      ['<C-o>'] = cmp.mapping.complete(),
		      ['<C-e>'] = cmp.mapping.abort(),
		      ['<CR>'] = cmp.mapping.confirm({ select = true }),
	
		      ["<Tab>"] = cmp.mapping(function(fallback)
			      if cmp.visible() then
				cmp.select_next_item()
			      elseif luasnip.expandable() then
				luasnip.expand()
			      elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			      elseif check_backspace() then
				fallback()
			      else
				fallback()
			      end
			    end, {
			      "i",
			      "s",
			    }),
			    ["<S-Tab>"] = cmp.mapping(function(fallback)
			      if cmp.visible() then
				cmp.select_prev_item()
			      elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			      else
				fallback()
			      end
			    end, {
			      "i",
			      "s",
			    }),
		}),

			})


	-- borders! 
	-- Specify how the border looks like
	local border = {
	    { '┌', 'FloatBorder' },
	    { '─', 'FloatBorder' },
	    { '┐', 'FloatBorder' },
	    { '│', 'FloatBorder' },
	    { '┘', 'FloatBorder' },
	    { '─', 'FloatBorder' },
	    { '└', 'FloatBorder' },
	    { '│', 'FloatBorder' },
	}

	-- Add the border on hover and on signature help popup window
	local handlers = {
	    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
	}

	-- Add border to the diagnostic popup window
	vim.diagnostic.config({
	    virtual_text = {
		prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 
	    },
	    float = { border = border },
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
		keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts) -- show diagnostics for line

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
		handlers = handlers,
	})

	-- lspconfig['jedi_language_server'].setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	handlers = handlers,
	-- })
	
	-- Python
	lspconfig["pylsp"].setup {
	  on_attach = on_attach,
	  settings = {
	    pylsp = {
	      plugins = {
		flake8 = {
		  enabled = false,
		  maxLineLength = 119,
		},
		mypy = {
		  enabled = true,
		},
		pycodestyle = {
		  enabled = false,
		},
		pyflakes = {
		  enabled = false,
		},
	      }
	    }
	  }
	}

	lspconfig["ruff_lsp"].setup {
	  on_attach = on_attach,
	}


	lspconfig['html'].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers
	})

	lspconfig['tailwindcss'].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
	})

	-- lspconfig['pyright'].setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	filetypes = {"python"},
	-- })

	lspconfig['rust_analyzer'].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
	})

end,
}
