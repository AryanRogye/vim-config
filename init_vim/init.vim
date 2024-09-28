call plug#begin('~/.vim/plugged')

" List plugins here
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'stevearc/dressing.nvim' " optional for vim.ui.select
Plug 'akinsho/flutter-tools.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'preservim/nerdtree'
Plug 'github/copilot.vim'
Plug 'windwp/nvim-autopairs'
Plug 'folke/which-key.nvim'

call plug#end()

let mapleader = " "

" KeyMap for PlugInstalr
nnoremap <leader>ap :PlugInstall<CR>
nnoremap <leader>au :PlugUpdate<CR>

" KeyMap For NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Keybinds for Mason
nnoremap <leader>m :Mason<CR>
nnoremap <leader>mi :MasonInstall<CR>
nnoremap <leader>mu :MasonUpdate<CR>
nnoremap <leader>ml :MasonLog<CR>

" Enable GitHub Copilot
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_filetypes = {
      \ '': v:true,
      \ 'markdown': v:false,
      \ 'vim-plug': v:false,
      \ }

colorscheme desert
" To set the background color to transparent
hi Normal guibg=NONE ctermbg=NONE

set tabstop=4
set shiftwidth=4
set mouse=a
set nowrap
set relativenumber
set number               " Show line numbers
set hidden               " Enable background buffers
set undofile             " Save undo history
set clipboard=unnamedplus " Use system clipboard

lua << EOF
--Enable Mason
require('mason').setup()

--Enableing which-key
require('which-key').setup {}

local wk = require("which-key")

wk.register({
    ["<leader>"] = {
        a = {
            p = { ":PlugInstall<CR>", "Plug Install" },
            u = { ":PlugUpdate<CR>", "Plug Update" },
        },
        m = {
            name = "Mason",
            m = { ":Mason<CR>", "Mason" },
            i = { ":MasonInstall<CR>", "Mason Install" },
            u = { ":MasonUpdate<CR>", "Mason Update" },
            l = { ":MasonLog<CR>", "Mason Log" },
        },
        n = { ":NERDTreeFocus<CR>", "NERDTree Focus" },
    },
    ["<C-t>"] = { ":NERDTree<CR>", "NERDTree" },
    ["<C-n>"] = { ":NERDTreeToggle<CR>", "NERDTree Toggle" },
    ["<C-f>"] = { ":NERDTreeFind<CR>", "NERDTree Find" },
})


EOF
