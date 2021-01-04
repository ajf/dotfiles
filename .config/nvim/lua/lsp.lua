vim.api.nvim_set_option('updatetime', 500)
vim.api.nvim_command[[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command[[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command[[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
}

local rt = require("rust-tools")
rt.setup({
	server = {
		on_attach = function(_, bufnr)
			--Enable completion triggered by <c-x><c-o>
			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

			-- Mappings.
			local opts = { noremap=true, silent=true, buffer=bufnr }

			-- See `:help vim.lsp.*` for documentation on any of the below functions
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set('n', '<leader>rr', '<cmd>RustRunnables<CR>', {})
		end,
		},
})
