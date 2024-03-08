return {
    'nvim-lua/plenary.nvim',
    {
        'f-person/git-blame.nvim',
        config = function()
            vim.g.gitblame_display_virtual_text = 0
        end
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")
        end
    },
    {
        'cappyzawa/trim.nvim', opts = {
            trim_last_line = false,
        }
    },
}
