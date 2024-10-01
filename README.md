# Vim Config

This is a Neovim configuration with organized plugins and settings, using `lazy.nvim` as a plugin manager. The setup includes LSP configuration, key mappings, autocompletion, syntax highlighting, and more, all organized into separate files.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Folder Structure](#folder-structure)
- [Usage](#usage)
- [Plugins](#plugins)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Features

- Organized plugin management with `lazy.nvim`
- LSP support for multiple languages (Go, Rust, JavaScript, Python, etc.)
- Autocompletion using `nvim-cmp` and snippets with `LuaSnip`
- Syntax highlighting with `nvim-treesitter`
- Code formatting with Prettier
- LaTeX support via `vimtex`
- Beautiful themes including Gruvbox, Rose Pine, and Tokyo Night
- Enhanced Neovim UI with `which-key`, `noice.nvim`, and `nvim-notify`

## Requirements

- [Neovim](https://neovim.io/) (v0.5 or higher)
- A package manager such as [Homebrew](https://brew.sh/) to install dependencies (optional)
- `yarn` (for Prettier) and `Node.js` for JavaScript development

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/vim-config.git ~/.config/nvim

2. install lazy.nvim: 
   ```bash
    git clone --depth 1 https://github.com/folke/lazy.nvim ~/.local/share/nvim/site/pack/lazy/start/lazy.nvim

3. Make sure you have the required external tools for language servers:

   - Install LSP servers using `Mason`. Open Neovim and run:
     ```vim
     :Mason
     ```
     Use the UI to install the LSP servers you need (e.g., `gopls`, `rust_analyzer`, `pyright`, etc.).

   - Install system dependencies for specific LSP servers if necessary. For example:
     - For `clangd` (C/C++), install `clangd` via a package manager:
       ```bash
       brew install llvm
       ```
     - For `gopls` (Go):
       ```bash
       go install golang.org/x/tools/gopls@latest
       ```
     - For Python LSP (`pyright`):
       ```bash
       npm install -g pyright
       ```
     - For Swift (`sourcekit-lsp`), ensure Xcode and the Xcode command-line tools are installed.

5. After installing the required LSP servers, restart Neovim.

## Folder Structure (Detailed)

- **`new-organized/init.lua`**: The entry point for Neovim, this file sets up the plugin manager (`lazy.nvim`) and loads various configurations from modular files.
- **`lazy-lock.json`**: This file is generated by `lazy.nvim` to lock plugin versions. Do not modify this file manually.
- **`lua/cmp_config.lua`**: Configuration for the `nvim-cmp` plugin, which handles autocompletion.
- **`lua/keymaps.lua`**: Custom key mappings for Neovim, including shortcuts for NERDTree, Telescope, LSP commands, and more.
- **`lua/lsp.lua`**: LSP setup and configuration, including the installation of LSP servers via `Mason`.
- **`lua/notify_config.lua`**: Configuration for the `nvim-notify` plugin, which provides a customizable notification system in Neovim.
- **`lua/plugins.lua`**: Lists and manages all plugins using `lazy.nvim`.
- **`lua/prettier_config.lua`**: Configuration for Prettier, a code formatter, including automatic formatting on save for JavaScript and TypeScript files.
- **`lua/telescope_config.lua`**: Custom configuration for `Telescope`, a fuzzy finder plugin.
- **`lua/themes.lua`**: Defines and loads different themes (e.g., Gruvbox, Rose Pine, Tokyo Night).
- **`lua/treesitter_config.lua`**: Configuration for `nvim-treesitter`, a plugin that enhances syntax highlighting and code parsing.

## Plugins

Here is a quick overview of some key plugins and their purposes:

- **NERDTree**: A file explorer tree for Neovim.
- **Mason.nvim**: Manages external LSP servers, linters, and formatters.
- **LSPconfig**: Integrates Neovim's built-in LSP support with Mason.
- **nvim-cmp**: Autocompletion engine with various sources (LSP, buffer, path, etc.).
- **nvim-treesitter**: Syntax highlighting and parsing based on code structure.
- **Telescope**: Fuzzy finder for files, text, and more.
- **VimTex**: LaTeX support in Neovim.
- **Prettier**: Code formatter for JavaScript and TypeScript.
- **Noice.nvim**: Enhances the Neovim UI for messages and commands.
- **Which-Key**: Displays available keybindings in Neovim.

For a full list of plugins, refer to the `plugins.lua` file.

## Customization

You can easily customize the configuration by editing the corresponding files:

- **Themes**: Modify `init.lua` to switch between Gruvbox, Rose Pine, and Tokyo Night make sure to have the other 2 commented.
    - U can add more themes inside the `new-organized/lua/themes.lua` file
- **Key Mappings**: Change or add new keybindings in `keymaps.lua`.
- **LSP**: Add or remove language servers in `lsp.lua` by updating the `ensure_installed` section and configuring the LSP options.
- **Autocompletion**: Modify `cmp_config.lua` to customize the completion engine settings.