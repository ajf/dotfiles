local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

require("lazy").setup({
    {
        'L3MON4D3/LuaSnip',
        version = "v2.*",
    },
    'airblade/vim-gitgutter',
    'dag/vim-fish',
    {
        'folke/tokyonight.nvim',
        lazy = false,
        config = function()
            require("tokyonight").setup({
                style = "",
                terminal_colors = true,
            })
        end
    },
    {
        'cappyzawa/trim.nvim', opts = {
            trim_last_line = false,
        }
    },
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

            require("luasnip/loaders/from_vscode").load{}
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
                        mode = 'symbol',
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
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
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
    'lervag/vimtex',
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            vim.cmd([[let g:neo_tree_remove_legacy_commands = 1]])
            vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/lsp-status.nvim',
        },
        config = function()
            require('lualine').setup({
		    options = {
			    theme = "tokyonight"
		    },
		    sections = {
			    lualine_a = { { 'filename', file_status = true, path = 1, shorting_target = 20 } },
			    lualine_c = { "os.date('%A %H:%M')", 'data', "require'lsp-status'.status()" }
		    }
	    })
        end
    },
    'mracos/mermaid.vim',
    'nvim-lua/lsp_extensions.nvim',
    {
	    'stevearc/aerial.nvim',
	    dependencies = {
		    "nvim-treesitter/nvim-treesitter",
		    "nvim-tree/nvim-web-devicons"
	    },
    },
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'onsails/lspkind-nvim',
    'rafamadriz/friendly-snippets',
    {
	    'mrcjkb/rustaceanvim',
	    version = '^4',
	    ft = { 'rust' },
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
        ft = { 'toml' },
    },
    "nvimtools/none-ls.nvim",
    "f-person/git-blame.nvim",
    'shaunsingh/nord.nvim',
    'tpope/vim-fugitive',
    'tpope/vim-markdown',
    'tpope/vim-surround',
    'mbbill/undotree',                -- display undotree for file, configured to <leader>u
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "rust", "toml", "fish", "markdown", "sql", "yaml" },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                ident = { enable = true },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                }
            })
        end
    },
})
