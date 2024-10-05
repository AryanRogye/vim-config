-- Automatically install lazy.nvim if not installed or if something goes wrong
local ensure_lazy = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/lazy/start/lazy.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/folke/lazy.nvim', install_path})
        vim.cmd [[packadd lazy.nvim]]
        return true
    end
    return false
end
local lazy_bootstrap = ensure_lazy()
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then return end

-- Installing plugins here
lazy.setup({
    -- NERDTREE ICONS: to show icons on nerdtree
    {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require('nvimtree_config') -- Load your config from the separate file
        end,
    },
    -- NERDTREE: A file explorer for navigating your file system in Neovim.
    -- {'preservim/nerdtree'},
    -- Mason: Manages external tools such as LSP servers, linters, formatters.
    {'williamboman/mason.nvim'},
    -- Mason LSPconfig: Bridges between Mason and Neovim LSPconfig.
    {'williamboman/mason-lspconfig.nvim'},
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            -- Configuring the SourceKit language server (for Swift/Objective-C)
            lspconfig.sourcekit.setup {}
        end,
    },
    -- Telescope: A fuzzy finder for searching files, text, or Neovim buffers.
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' } -- Plenary is required for Telescope.
    },
    -- nvim-cmp: Autocompletion plugin for Neovim.
    {'hrsh7th/nvim-cmp'},
    -- nvim-cmp source for LSP completions.
    {'hrsh7th/cmp-nvim-lsp'},
    -- nvim-cmp source for buffer words completion.
    {'hrsh7th/cmp-buffer'},
    -- nvim-cmp source for filesystem paths.
    {'hrsh7th/cmp-path'},
    -- nvim-cmp source for command-line completion.
    {'hrsh7th/cmp-cmdline'},
    -- Luasnip source for nvim-cmp (snippets integration).
    {'saadparwaiz1/cmp_luasnip'},
    -- LuaSnip: Snippets engine for Neovim.
    {'L3MON4D3/LuaSnip'},
    -- A collection of snippets for various languages.
    {'rafamadriz/friendly-snippets'},
    -- nvim-autopairs: Automatically close brackets, parentheses, etc., when typing.
    {'windwp/nvim-autopairs', event = "InsertEnter", config = true},
    -- Gruvbox: A popular color scheme for Neovim.
    {'morhetz/gruvbox'},
    -- Rose-pine: Another color scheme for Neovim.
    { "rose-pine/neovim", name = "rose-pine" },
    -- nvim-treesitter: Provides advanced syntax highlighting based on parsing code trees.
    {'nvim-treesitter/nvim-treesitter'},
    -- Noice: Enhances the command line and message output in Neovim.
    {"folke/noice.nvim", event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",   -- Required UI component for Noice.
            "rcarriga/nvim-notify",   -- A notification system used by Noice.
        }
    },
    -- Which-Key: Displays available keybindings in Neovim when a key is pressed.
    {"folke/which-key.nvim", event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    -- vim-prettier: Integration for Prettier, a code formatter, in Neovim.
    {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production'},
    -- vim-jsx-pretty: Syntax highlighting for JSX and TSX (React, TypeScript files).
    {'MaxMEllon/vim-jsx-pretty'},
    -- Neomake: Asynchronous linting and build system integration for Neovim.
    {'neomake/neomake'},
    -- VimTeX: Provides LaTeX editing support in Neovim.
    {
        'lervag/vimtex',
        ft = 'tex',  -- Only loads for LaTeX files (.tex).
        config = function()
            vim.g.tex_flavor = 'latex'                -- Set LaTeX as the default flavor.
            vim.g.vimtex_view_method = 'skim'         -- Use Skim as the PDF viewer.
            vim.g.vimtex_quickfix_mode = 0            -- Disable quickfix mode by default.
            vim.g.vimtex_compiler_latexmk = {
                build_dir = 'build',                  -- Set a custom build directory.
                options = {
                    '-shell-escape',
                    '-verbose',
                    '-file-line-error',
                    '-interaction=nonstopmode',
                    '-synctex=1'
                }
            }
            -- Skim PDF viewer SyncTeX integration.
            vim.g.vimtex_view_skim_sync = 1
            vim.g.vimtex_view_skim_activate = 1
        end
    },
    -- TokyoNight: Another color scheme for Neovim with a high priority to load first.
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},     	
    },
    { 'tpope/vim-commentary', lazy = false },
    {'terryma/vim-smooth-scroll'},
    {'tpope/vim-surround'},
    { 'ThePrimeagen/harpoon', config = function() require('harpoon').setup() end },
    { 'ap/vim-css-color' },
    { 'tpope/vim-sleuth' },
    { 'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end },
})
if lazy_bootstrap then
    require('lazy').sync()
end
