vim.g.nord_contrast = true
vim.g.nord_italic = true
vim.g.nord_bold = true
vim.g.nord_borders = true

vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { expr = false, noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", { expr = false, noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", { expr = false, noremap = true })

require("tokyonight").setup({
    style = "storm",
    terminal_colors = true,
})

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

vim.cmd([[let g:neo_tree_remove_legacy_commands = 1]])
vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

require("aerial").setup({
    on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end
})

require("gitsigns").setup()
