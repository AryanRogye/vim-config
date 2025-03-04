return {
    "hrsh7th/nvim-cmp",
    event = {"InsertEnter", "CmdLineEnter"},
    enabled = true,
    opts = function(_, opts)

        -- require the cmp and luasnip module
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- set the completion options
        local confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }

        -- set the window options
        local window = {
            -- Window for the completion
            completion = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Pmenu",
                scrollbar = true,
                col_offset = 0,
                side_padding = 1,
            },
            -- Window for the documentation
            documentation = {
                border = "solid",
                winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Pmenu",
                scrollbar = true,
            },
        }


        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "fugitive" },
                { name = "buffer" },
            }),
        })

        -- Dont Use SQL
        -- cmp.setup.filetype("sql", {
        --     sources = cmp.config.sources({
        --         { name = "vim-dadbod-completion" },
        --         { name = "buffer" },
        --     }),
        -- })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                    { name = "cmdline", option = { ignore_cmds = { 'Man', "!'" } } },
                }),
        })

        local snippet = {
            expand = function(args) luasnip.lsp_expand(args.body) end,
        }

        local mapping = {
            ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
            ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
            ["<C-c>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.abort()
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
                else
                    fallback()
                end
            end, { "i", "c" }),
            ["<C-Space>"] = cmp.mapping.complete(),

            -- Add your other mappings here
            ["<CR>"] = cmp.mapping.confirm { select = true },
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require('luasnip').jumpable(1) then
                    require('luasnip').jump(1)
                else
                    fallback() -- Fallback to default behavior
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require('luasnip').jumpable(-1) then
                    require('luasnip').jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        }

        local source_mapping = {
            buffer        = "[Buffer]",
            luasnip       = "[Snippet]",
            nvim_lsp      = "[LSP]",
            nvim_lua      = "[Lua]",
            path          = "[Path]",
        }

        local formatting = {
            fields = {'kind', 'abbr', 'menu'},
            format = function(entry, vim_item)
                local kind_icons = require("Aryan.core.icons").kind
                vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
                vim_item.menu = (source_mapping)[entry.source.name]

                -- Check if the completion item is a function/method and doesn't already have parentheses
                if vim_item.kind == "Function" or vim_item.kind == "Method" then
                    if not vim_item.abbr:match("%(%)") then
                        vim_item.abbr = vim_item.abbr .. "()" -- Append `()` only if not present
                    end
                end

                return vim_item
            end
        }

        local sources = {
            { name = "buffer",        keyword_length = 3, max_item_count = 10, priority = 500 },
            { name = "luasnip",       keyword_length = 1, max_item_count = 10, priority = 825 },  -- Snippets appear after 2 letters
            { name = "nvim_lsp",      keyword_length = 1, max_item_count = 10, priority = 900 },
            { name = "nvim_lua",      keyword_length = 1, max_item_count = 10, priority = 800 },
            { name = "path",          keyword_length = 3, max_item_count = 20, priority = 250 },
        }

        opts.confirm_opts = confirm_opts
        opts.formatting = formatting
        opts.mapping = mapping
        opts.snippet = snippet
        opts.sources = sources
        opts.window = window
    end,

    config = function(_, opts)
        for _, source in ipairs(opts.sources) do
            source.group_index = source.group_index or 1
        end
        require("cmp").setup(opts)
    end,
}
