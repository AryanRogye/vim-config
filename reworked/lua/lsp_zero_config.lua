return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v1.x',
	dependencies = {
		{'neovim/nvim-lspconfig'},  -- LSP support
		{'williamboman/mason.nvim'}, -- Tool manager for LSP servers
		{'williamboman/mason-lspconfig.nvim'}, -- Integration between mason and lspconfig
		{'hrsh7th/nvim-cmp'},  -- Autocompletion plugin
		{'hrsh7th/cmp-nvim-lsp'}, -- Autocompletion for LSP
	},
	config = function()
		local lsp = require('lsp-zero')
		lsp.preset('recommended')			
		lsp.ensure_installed({
			'gopls',         -- Go
			'clangd',        -- C/C++
			'pyright',       -- Python
			'rust_analyzer', -- Rust
			'jdtls',         -- Java
			'zls',           -- Zig
		})

		lsp.on_attach(function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			local lsp_mappings = require("keymappings.lsp_keymaps")
		end)

		-- Configure nvim-cmp with capabilities
		local cmp = require('cmp')
		local cmp_mappings = lsp.defaults.cmp_mappings({
			['<C-Space>'] = cmp.mapping.complete(),
			['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept completion with Enter
		})

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings,
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
				{ name = 'path' },
			},
		})

		-- Set up LSP-zero
		lsp.setup()

		-- Diagnostics configuration
		vim.diagnostic.config({
			virtual_text = {
				prefix = '●', -- Choose '●', '▎', or any icon you prefer
			},
			signs = true,
			underline = true,
			update_in_insert = false, -- Disable diagnostics in insert mode
			severity_sort = true,
			float = {
				focusable = false,
				style = 'minimal',
				border = 'rounded',
				source = 'always',
				header = '',
				prefix = '',
			},
		})

		-- Define diagnostic signs
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end
}
