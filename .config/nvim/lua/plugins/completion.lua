return {
    "nvimtools/none-ls.nvim",
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'saecki/crates.nvim',
        },
        config = function()
            require("cmp_nvim_lsp").setup()

            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")
            local icons = require("tb.icons")

            require("luasnip.loaders.from_vscode").lazy_load{}

            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            cmp.setup {
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',
                        symbol_map = {
                            Class = icons.lang.class,
                            Color = icons.lang.color,
                            Constant = icons.lang.constant,
                            Constructor = icons.lang.constructor,
                            Enum = icons.lang.enum,
                            EnumMember = icons.lang.enummember,
                            Event = icons.lang.event,
                            Field = icons.lang.field,
                            File = icons.lang.file,
                            Folder = icons.lang.folder,
                            Function = icons.lang["function"],
                            Interface = icons.lang.interface,
                            Keyword = icons.lang.keyword,
                            Method = icons.lang.method,
                            Module = icons.lang.module,
                            Operator = icons.lang.operator,
                            Property = icons.lang.property,
                            Reference = icons.lang.reference,
                            Snippet = icons.lang.snippet,
                            Struct = icons.lang.struct,
                            Text = icons.lang.text,
                            TypeParameter = icons.lang.typeparameter,
                            Unit = icons.lang.unit,
                            Value = icons.lang.value,
                            Variable = icons.lang.variable
                        }
                    })
                },
                min_length = 0, -- allow for `from package import _` in Python
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    -- Add tab support
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                            -- that way you will only jump inside the snippet region
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    })
                },
                sources = cmp.config.sources({
                    {name = "nvim_lsp"},
                    {name = "luasnip"},
                    {name = "crates"}
                }, { { name = "buffer" } })
            }
        end
    },
}
