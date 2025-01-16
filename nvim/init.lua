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
    -- NERDTREE
    {'preservim/nerdtree'},
    -- ALL LSP STUFF
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.sourcekit.setup {}
		end,
	},
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'saadparwaiz1/cmp_luasnip'},
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
    -- AUTOPAIRS
    {'windwp/nvim-autopairs', event = "InsertEnter", config = true},
    -- THEME
    -- GRUVBOX THEME
    {'morhetz/gruvbox'},
    { "rose-pine/neovim", name = "rose-pine" },
    -- SYNTAX HIGHLIGHTING
    {'nvim-treesitter/nvim-treesitter'},
    -- NOICE PLUGIN FOR CMD
    {"folke/noice.nvim", event = "VeryLazy",
        opts = {},
        dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify",}
    },
    {"folke/which-key.nvim", event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    -- Prettier for formatting
    {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production'},
    -- JSX/TSX syntax highlighting
    {'MaxMEllon/vim-jsx-pretty'},
    -- ESLint integration
    {'neomake/neomake'},
    {
        'lervag/vimtex',
        ft = 'tex',  -- Load only for .tex files
        config = function()
            vim.g.tex_flavor = 'latex'                -- Set LaTeX as the default flavor
            vim.g.vimtex_view_method = 'skim'         -- Set Skim as the PDF viewer
            vim.g.vimtex_quickfix_mode = 0            -- Disable quickfix mode by default
            vim.g.vimtex_compiler_latexmk = {
                build_dir = 'build',                  -- Set a custom build directory
                options = {
                    '-shell-escape',
                    '-verbose',
                    '-file-line-error',
                    '-interaction=nonstopmode',
                    '-synctex=1'
                }
            }
            -- Additional configuration for Skim to enable SyncTeX
            vim.g.vimtex_view_skim_sync = 1
            vim.g.vimtex_view_skim_activate = 1
        end
    },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
})

-- NOTIFICATIONS
require('notify').setup({
    max_width = 50,
    max_height = 10,
    background_colour = "#000000",
    stages = "fade_in_slide_out",
    timeout = 3000,
    top_down = false,
})

-- Set notify as the default notification provider
vim.notify = require('notify')

if lazy_bootstrap then
    require('lazy').sync()
end

vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = 'a'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hidden = true
vim.opt.undofile = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.laststatus = 2
vim.cmd('syntax on')
vim.g.have_nerd_font = true
vim.opt.showmode = false

-- Tokyonight Theme

--require('tokyonight').setup({
	--style = "night", -- Choose from 'storm', 'night', 'moon', or 'day'
	--transparent = true, -- Enable transparency
	--terminal_colors = true, -- Apply colors to Neovim terminal
	--styles = {
		--sidebars = "transparent", -- Make sidebars (e.g., NERDTree) transparent
		--floats = "transparent", -- Make floating windows transparent
	--},
--})
--vim.cmd[[colorscheme tokyonight]]


-- Gruvbox Theme 

vim.opt.termguicolors = true
vim.g.gruvbox_contrast_light = 'hard'
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE
]])


-- Rose Pine Theme

-- require('rose-pine').setup({
    -- dark_variant = 'moon', -- Choose between 'main' and 'moon'
    -- disable_background = true, -- Disable background for transparency
    -- disable_float_background = true, -- Disable background for floating windows
-- })
-- vim.cmd('colorscheme rose-pine')

-- Set Keybinds

-- SETTING MAPLEADER
vim.g.mapleader = " "

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- REMAP FOR SOURCING
vim.api.nvim_set_keymap('n', '<leader>s', ':so<CR>', { noremap = true, silent = true })

-- KEYMAP FOR NERDTREE
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- KEYMAP FOR LAZY
vim.api.nvim_set_keymap('n', '<leader>l', ':Lazy<CR>', { noremap = true, silent = true })

-- KEYMAP FOR MASON
vim.api.nvim_set_keymap('n', '<leader>m', ':Mason<CR>', { noremap = true, silent = true })

-- Set Keybindings for vimtex
vim.api.nvim_set_keymap('n', '<leader>ll', ':VimtexCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lv', ':VimtexView<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lk', ':VimtexStop<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lo', ':VimtexErrors<CR>', { noremap = true, silent = true })

-- Configure which-key
local wk = require("which-key")

wk.register({
    -- General
    ["<leader>s"] = { "<cmd>so<cr>", "Source File" },
    ["<leader>l"] = { "<cmd>Lazy<cr>", "Lazy Command" },
    ["<leader>m"] = { "<cmd>Mason<cr>", "Mason Command" },
    -- File Navigation with Telescope
    ["<leader>f"] = {
        name = "Find", -- Group name
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
    },
    -- LSP Mappings
    ["<leader>l"] = {
        name = "LSP",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation" },
        k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Documentation" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
        n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
    },
    -- VimTeX Keybindings
    ["<leader>v"] = {
        name = "VimTeX",
        l = { "<cmd>VimtexCompile<CR>", "Compile" },
        v = { "<cmd>VimtexView<CR>", "View PDF" },
        k = { "<cmd>VimtexStop<CR>", "Stop Compilation" },
        e = { "<cmd>VimtexErrors<CR>", "Show Errors" },
    },
    -- Prettier for formatting
    ["<leader>p"] = { "<cmd>Prettier<cr>", "Prettier Format" },
    -- Utility
    ["<leader>?"] = { function() wk.show() end, "Show all mappings" }
})

wk.register({
    ["<C-n>"] = { "<cmd>NERDTreeToggle<cr>", "Toggle NERDTree" },
}, { mode = 'n' })

-- Mouse-based command-click like functionality
wk.register({
    ["<C-LeftMouse>"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition (Click)" }
}, { mode = 'n' })

-- LSP Diagnostic Navigation
wk.register({
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
    ["<leader>e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
    ["<leader>q"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix List" },
})

-- Configure nvim-treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"go", "c", "rust", "css", "java", "javascript", "typescript", "zig"},
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
    }
}

-- Configuring Prettier
vim.api.nvim_exec([[
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx PrettierAsync
]], false)

-- Configure Mason
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }	
})

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = {"gopls", "clangd", "pyright", "rust_analyzer", "jdtls"},
    automatic_installation = true,
})

local lspconfig = require("lspconfig")

-- Standard on_attach function for LSP
local on_attach = function(client, bufnr)
    print("LSP attached to buffer " .. bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    -- LSP Keybindings
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Go to definition
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)  -- Find references
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- Go to implementation
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)        -- Hover information
    buf_set_keymap('n', '<C-LeftMouse>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- Command-click like navigation
end

-- Setting up capabilities for LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup for LSP servers

-- Rust LSP
lspconfig.rust_analyzer.setup { on_attach = on_attach, capabilities = capabilities } 

-- Go LSP
lspconfig.gopls.setup { on_attach = on_attach, capabilities = capabilities } 

-- C/C++/Obj-C LSP
lspconfig.clangd.setup { 
	on_attach = on_attach, 
	capabilities = capabilities,
	-- Include the necessary flags and paths for GLFW
	cmd = {
        "clangd", 
        "--header-insertion=never",
        "--compile-commands-dir=.",
        "-I/opt/homebrew/opt/glfw/include",  -- Include GLFW headers
        "-L/opt/homebrew/opt/glfw/lib",      -- GLFW library path
        "-std=c++20"                         -- C++ standard
    }
}

-- TypeScript LSP
lspconfig.tsserver.setup { on_attach = on_attach, capabilities = capabilities } -- TypeScript LSP

-- Python LSP
lspconfig.pyright.setup { -- Python LSP
    on_attach = on_attach,
    settings = {
        python = {
            pythonPath = "/usr/local/bin/python3"
        }
    },
    capabilities = capabilities,
}

-- Java LSP
lspconfig.jdtls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'jdtls' }, 
    root_dir = function(fname)
        return lspconfig.util.root_pattern('pom.xml', 'build.gradle', '.git')(fname) or vim.fn.getcwd()
    end,
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' }, -- Use fernflower for decompiling Java classes
        },
    },
}

-- nvim-cmp setup
local cmp = require'cmp'
local luasnip = require'luasnip'

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
    }),
})

-- This setup configures completion for when you are searching within buffers using the `/` command.
-- It will suggest words or text that exist in the current buffer.
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }  -- Uses the content from the current buffer for suggestions.
    }
})

-- This setup configures completion for when you're using the command-line (`:`).
-- It first suggests file paths (`path`) and then commands and options (`cmdline`) as you type.
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }    -- Suggests paths for file/directory completion.
    }, {
        { name = 'cmdline' } -- Provides completion for Vim commands.
    })
})

-- Dart LSP
lspconfig.dartls.setup{
    cmd = { "dart", "language-server", "--protocol=lsp" },
    filetypes = { "dart" },
    root_dir = lspconfig.util.root_pattern("pubspec.yaml", ".git"),
    init_options = {
        closingLabels = true,
        flutterOutline = true,
        onlyAnalyzeProjectsWithOpenFiles = true,
        outline = true,
        suggestFromUnimportedLibraries = true
    }
}


-- Setting Up LSP For Swift
lspconfig.sourcekit.setup {
    capabilities = {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    },
}
