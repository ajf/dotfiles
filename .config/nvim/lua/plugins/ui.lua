return {
    'shaunsingh/nord.nvim',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { expr = false, noremap = true })
            vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", { expr = false, noremap = true })
            vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", { expr = false, noremap = true })
        end
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                terminal_colors = true,
            })
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/lsp-status.nvim',
            'f-person/git-blame.nvim',
        },
        config = function()
            local git_blame = require('gitblame')
            require('lualine').setup({
                options = {
                    theme = "nord"
                },
                sections = {
                    lualine_a = { { 'filename', file_status = true, path = 1, shorting_target = 20 } },
                    lualine_c = { "os.date('%A %H:%M')", 'data', "require'lsp-status'.status()" },
                    lualine_x = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }, "encoding", "fileformat", "filetype" },
                }
            })
        end
    },
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
        'stevearc/aerial.nvim',
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("aerial").setup({
                on_attach = function(bufnr)
                    -- Jump forwards/backwards with '{' and '}'
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
                end
            })
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                yadm = {
                    enable = true
                }
            })
        end
    },
}
