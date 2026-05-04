require('nvim-treesitter').install({
    "lua", "rust", "toml", "fish", "markdown", "sql", "yaml", "latex",
    "mermaid", "pem", "dockerfile", "diff", "csv", "ssh_config", "tmux",
    "vim", "terraform", "proto", "passwd", "git_config", "bash", "comment",
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
