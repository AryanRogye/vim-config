return {
  "hrsh7th/nvim-cmp",
  event = {"InsertEnter", "CmdLineEnter"},
  enabled = true,
  opts = function(_, opts)
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }

    local window = {
      completion = {
        border = "rounded",
        winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Pmenu',
        scrollbar = false,
      },
      documentation = {
        border = "rounded",
        winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Pmenu',
        scrollbar = false,
      },
    }

    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "fugitive" },
        { name = "buffer" },
        { name = "spell" },
      }),
    })

    cmp.setup.filetype("sql", {
      sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
      }),
    })

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

    local function has_words_before()
      local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end

    local check_backspace = function()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    local kind_icons = require("Aryan.core.icons").kind

    local snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end,
    }

        local mapping = {
            ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
            ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
            ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
            ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
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
      spell         = "[Spell]",
      buffer        = "[Buffer]",
      calc          = "[calc]",
      latex_symbols = "[LaTeX]",
      luasnip       = "[Snippet]",
      nvim_lsp      = "[LSP]",
      nvim_lua      = "[Lua]",
      path          = "[Path]",
    }

    local formatting = {
      fields = {'kind', 'abbr', 'menu'},
      format = function(entry, vim_item)
        vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
        vim_item.menu = (source_mapping)[entry.source.name]
        return vim_item
      end
    }

        local sources = {
            { name = "spell",         keyword_length = 4, max_item_count = 10, priority = 450 },
            { name = "buffer",        keyword_length = 3, max_item_count = 10, priority = 500 },
            { name = "calc",          keyword_length = 3, max_item_count = 10, priority = 250 },
            { name = "latex_symbols", keyword_length = 1, max_item_count = 10, priority = 300 },
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
