return {
    'onsails/lspkind-nvim',
    {
        'kosayoda/nvim-lightbulb',
        config = function()
            require("nvim-lightbulb").setup({
               autocmd = {
                   enabled = true,
                   updatetime = -1
               },
             })
         end
     }
 }
