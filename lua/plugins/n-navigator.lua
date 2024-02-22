---@diagnostic disable: trailing-space, missing-fields
return {
    'numToStr/Navigator.nvim',
    config = function()
        require('Navigator').setup({
            auto_save = 'current',
            disable_on_zoom = true,
        })
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }
        map('n', 'wh', "<CMD>lua require('Navigator').left()<CR>", opts)
        map('n', 'wj', "<CMD>lua require('Navigator').up()<CR>", opts)
        map('n', 'wk', "<CMD>lua require('Navigator').down()<CR>", opts)
        map('n', 'wl', "<CMD>lua require('Navigator').right()<CR>", opts)
        map('n', 'wp', "<CMD>lua require('Navigator').previous()<CR>", opts)
    end,
}
