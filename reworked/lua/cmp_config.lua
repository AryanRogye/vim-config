
return {
	-- nvim-cmp: Autocompletion plugin for Neovim.
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Adding dependencies here to the main `nvim-cmp` plugin.
			'hrsh7th/cmp-nvim-lsp',         -- LSP completions
			'hrsh7th/cmp-buffer',           -- Buffer words completions
			'hrsh7th/cmp-path',             -- Filesystem path completions
			'hrsh7th/cmp-cmdline',          -- Command-line completions
			'saadparwaiz1/cmp_luasnip',     -- Luasnip completions
			'L3MON4D3/LuaSnip',             -- Snippets engine
			'rafamadriz/friendly-snippets', -- Snippets for various languages
		},
		config = function()  -- Use `config` here to configure after loading `nvim-cmp`.
			local cmp = require'cmp'
			local luasnip = require'luasnip'
			require('luasnip.loaders.from_vscode').lazy_load()
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = {
					['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
					['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
					['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
					['<C-y>'] = cmp.config.disable, 
					['<C-e>'] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
					{ name = 'path' },
				}),
			})

			-- Completion for search within buffers
			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),  -- Optional for command line consistency
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Completion for command-line mode
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),  -- Optional for command line consistency
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				})
			})
		end
	},
	-- No need for individual setup functions for these plugins as they are dependencies.
	-- The rest of the dependencies will automatically be loaded when `nvim-cmp` is loaded.
}

