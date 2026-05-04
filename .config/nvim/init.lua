vim.g.mapleader = ","

vim.pack.add({
    -- shared dependencies
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/MunifTanjim/nui.nvim',

    -- util
    'https://github.com/f-person/git-blame.nvim',
    'https://github.com/mbbill/undotree',
    'https://github.com/cappyzawa/trim.nvim',

    -- lsp
    'https://github.com/nvimtools/none-ls.nvim',
    'https://github.com/onsails/lspkind-nvim',
    'https://github.com/kosayoda/nvim-lightbulb',

    -- completion
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-cmdline',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-nvim-lua',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/saadparwaiz1/cmp_luasnip',
    'https://github.com/rafamadriz/friendly-snippets',
    'https://github.com/L3MON4D3/LuaSnip',

    -- syntax / treesitter
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/hiphish/rainbow-delimiters.nvim',
    'https://github.com/folke/todo-comments.nvim',

    -- rust
    'https://github.com/mrcjkb/rustaceanvim',
    'https://github.com/saecki/crates.nvim',

    -- ui
    'https://github.com/shaunsingh/nord.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/folke/tokyonight.nvim',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/nvim-lua/lsp-status.nvim',
    -- NOTE: previously pinned to branch "v2.x". vim.pack uses git tags, not branches.
    -- Check `neo-tree.nvim` releases and use { src = '...', version = 'vX.Y.Z' } if needed.
    'https://github.com/nvim-neo-tree/neo-tree.nvim',
    'https://github.com/stevearc/aerial.nvim',
    'https://github.com/lewis6991/gitsigns.nvim',

    -- colors
    'https://github.com/RRethy/base16-nvim',

    -- obsidian
    'https://github.com/obsidian-nvim/obsidian.nvim',
})

require("plugins.dankcolors")
require("plugins.util")
require("plugins.lsp")
require("plugins.completion")
require("plugins.syntax")
require("plugins.rust")
require("plugins.ui")
require("plugins.obsidian")
require("lsp")
require("customization")
