vim.g.gitblame_display_virtual_text = 0

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")

require('trim').setup({
    trim_last_line = false,
})
