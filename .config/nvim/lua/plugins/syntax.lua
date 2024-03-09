return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            "hiphish/rainbow-delimiters.nvim",
            "nvim-treesitter/nvim-treesitter-refactor",
        },
        run = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "rust", "toml", "fish", "markdown", "sql", "yaml", "latex", "markdown", "fish", "mermaid", "pem", "dockerfile", "diff", "csv", "ssh_config", "tmux", "vim", "terraform", "proto", "passwd", "git_config", "bash", "comment" },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                },
                refactor = {
                    highlight_definitions = {
                        enable = true,
                        -- Set to false if you have an `updatetime` of ~100.
                        clear_on_cursor_move = true,
                    },
                },
            })

            vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
        end
    },
}
