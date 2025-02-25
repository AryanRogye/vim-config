local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(_, bufnr)
    print("LSP ATTACHED")
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'J', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

lspconfig.cssls.setup({
    cmd = { "vscode-css-language-server", "--stdio" },
    capabilities = cmp_nvim_lsp.default_capabilities(),
    on_attach = on_attach, -- Reuse your existing on_attach
    filetypes = { "css", "scss", "less" },
    root_dir = lspconfig.util.root_pattern("package.json", ".git", ".cssrc"),
    settings = {
        css = { validate = true },
        less = { validate = true },
        scss = { validate = true },
    },
    flags = {
        debounce_text_changes = 150, -- Optional: Adjust diagnostics delay
    },
})

-- Lua LSP Setup (sumneko_lua)
lspconfig.lua_ls.setup({
    cmd = { "lua-language-server" }, -- Ensure `lua-language-server` is in your PATH
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT", -- Use LuaJIT for Neovim
                path = vim.split(package.path, ";"), -- Include Neovim runtime paths
            },
            diagnostics = {
                globals = { "vim" }, -- Recognize the `vim` global
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true, -- Neovim runtime files
                    [vim.fn.stdpath("config") .. "/lua"] = true, -- User config files
                },
                checkThirdParty = false, -- Disable telemetry prompts for third-party libraries
            },
            telemetry = {
                enable = false, -- Disable telemetry data collection
            },
        },
    },
})


lspconfig.pyright.setup({
    cmd = { "pyright-langserver", "--stdio" },
    capabilities = cmp_nvim_lsp.default_capabilities(),
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern(".git", "setup.py", "setup.cfg", "requirements.txt", "pyproject.toml", ""),
    settings = {
        python = {
            pythonPath = (function()
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                    return cwd .. "/venv/bin/python"
                elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                    return cwd .. "/.venv/bin/python"
                else
                    return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
                end
            end)(), -- Evaluate the function immediately
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
            },
        },
    },
})

lspconfig.jdtls.setup({
    cmd = { "jdtls" },
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle"),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = "/opt/homebrew/opt/openjdk@17", -- Replace with `echo $JAVA_HOME` if different
                    },
                },
            },
        },
    },
})

lspconfig.ts_ls.setup({
    cmd = { "typescript-language-server", "--stdio" },
    capabilities = cmp_nvim_lsp.default_capabilities(),
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
    flags = {
        debounce_text_changes = 150,
    },
})

-- Clangd Setup
lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index", "--clang-tidy", "--compile-commands-dir=./"},
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "c", "cpp", "objc", "objcpp", "ino" }, -- Add "ino" here
    flags = {
        debounce_text_changes = 100,
    },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "Makefile", ".git") or vim.loop.cwd(),
})

-- Arduino Setup
lspconfig.arduino_language_server.setup({
    cmd = {
        "arduino-language-server",
        "-cli-config", vim.fn.expand("~/.arduinoIDE/arduino-cli.yaml"),
        "-fqbn", "arduino:renesas_uno:unor4wifi",
        "-cli", "arduino-cli",
        "-clangd", "clangd"
    },
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "ino" },
    flags = {
        debounce_text_changes = 150,
    },
    root_dir = lspconfig.util.root_pattern("arduino-cli.yaml", ".git"),
})


-- RUST
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 50,
    },
})

-- GD Script
lspconfig.gdscript.setup({
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = function(client, bufnr)
        -- Example of attaching keybindings or settings
        print("GDScript LSP attached")
    end,
    flags = {
        debounce_text_changes = 150,
    },
    cmd = { "godot", "--headless", "--language-server" },
    filetypes = { "gd", "gdscript", "gdscript3" },
    root_dir = lspconfig.util.root_pattern("project.godot", ".git"),
})

lspconfig.gopls.setup({
    cmd = { "gopls" }, -- Ensure `gopls` is in your PATH
    capabilities = cmp_nvim_lsp.default_capabilities(),
    on_attach = on_attach,
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
})

lspconfig.ols.setup ({
    init_options = {
        checker_args = "-strict-style",
        collections = {
            { name = "shared", path = vim.fn.expand('$HOME/odin-lib') }
        },
    },
})

-- SWIFT
lspconfig.sourcekit.setup({
    cmd = { "sourcekit-lsp" }, -- Ensure sourcekit-lsp is installed
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "swift", "objective-c", "objective-cpp" },
    -- Look for .xcodeproj or .xcworkspace, fallback to .git
    root_dir = lspconfig.util.root_pattern(
        "*.xcworkspace",
        "*.xcodeproj",
        ".git"
    ),
})

lspconfig.efm.setup({
    init_options = { documentFormatting = true },
    capabilities = cmp_nvim_lsp.default_capabilities(),
    on_attach = on_attach,
    filetypes = { "odin" },
    root_dir = lspconfig.util.root_pattern(".git", "odin.mod"),

    settings = {
        languages = {
            odin = {
                {
                    lintCommand = "odin check ${INPUT}",
                    lintStdin = false,
                    lintFormats = {
                        "%f(%l:%c): %m",
                    },
                    formatCommand = "odin fmt",
                    formatStdin = true,
                }
            }
        }
    },
})


vim.diagnostic.config({
    virtual_text = { spacing = 2, prefix = "●" },
    update_in_insert = true,
    severity_sort = true,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.ino",
    callback = function()
        vim.bo.filetype = "cpp"
    end,
})
