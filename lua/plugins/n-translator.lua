return {
  'voldikss/vim-translator',
  event = 'VeryLazy',
  config = function()
    local opt = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<Leader>tl', ':TranslateW<cr>', opt)
    vim.api.nvim_set_keymap('v', '<Leader>tl', ':TranslateW<cr>', opt)
  end,
}
