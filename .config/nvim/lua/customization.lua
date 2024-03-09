vim.cmd[[colorscheme tokyonight]]

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.foldenable = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.undofile = true
vim.opt.updatetime = 500
vim.wo.foldmethod = 'expr'
vim.opt.signcolumn = 'yes'

vim.cmd([[
autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |   exe "normal! g`\"" | endif
]])

vim.bo.undofile = true
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
