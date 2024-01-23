vim.api.nvim_set_option('updatetime', 500)
vim.api.nvim_command[[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command[[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command[[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
