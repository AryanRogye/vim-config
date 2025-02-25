return {
    "folke/snacks.nvim",
    dependencies = {
        "echasnovski/mini.icons"
    },
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        bigfile = { enabled = true },
        words = { enabled = false },
        indent = { enabled = true },
        picker = { enabled = false }
    }
}

-- animate	Efficient animations including over 45 easing functions (library)	
-- bigfile	Deal with big files	‼️
-- bufdelete	Delete buffers without disrupting window layout	
-- dashboard	Beautiful declarative dashboards	‼️
-- debug	Pretty inspect & backtraces for debugging	
-- dim	Focus on the active scope by dimming the rest	
-- git	Git utilities	
-- gitbrowse	Open the current file, branch, commit, or repo in a browser (e.g. GitHub, GitLab, Bitbucket)	
-- indent	Indent guides and scopes	
-- input	Better vim.ui.input	‼️
-- layout	Window layouts	
-- lazygit	Open LazyGit in a float, auto-configure colorscheme and integration with Neovim	
-- notifier	Pretty vim.notify	‼️
-- notify	Utility functions to work with Neovim's vim.notify	
-- picker	Picker for selecting items	‼️
-- profiler	Neovim lua profiler	
-- quickfile	When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins.	‼️
-- rename	LSP-integrated file renaming with support for plugins like neo-tree.nvim and mini.files.	
-- scope	Scope detection, text objects and jumping based on treesitter or indent	‼️
-- scratch	Scratch buffers with a persistent file	
-- scroll	Smooth scrolling	‼️
-- statuscolumn	Pretty status column	‼️
-- terminal	Create and toggle floating/split terminals	
-- toggle	Toggle keymaps integrated with which-key icons / colors	
-- util	Utility functions for Snacks (library)	
-- win	Create and manage floating windows or splits	
-- words	Auto-show LSP references and quickly navigate between them	‼️
-- zen	Zen mode • distraction-free coding	
