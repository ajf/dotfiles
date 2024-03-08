local opts = { silent = false, buffer = vim.api.nvim_get_current_buf() }

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd.RustLsp("codeAction")
end, opts)
