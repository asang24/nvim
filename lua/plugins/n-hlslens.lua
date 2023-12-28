return {
  'kevinhwang91/nvim-hlslens',
  config = function()
    require('hlslens').setup {
      calm_down = true,
      nearest_only = true,
    }
    vim.keymap.set({ 'n', 'x' }, '<leader>nh', function()
      vim.schedule(function()
        if require('hlslens').exportLastSearchToQuickfix() then
          vim.cmd 'cw'
        end
      end)
      return ':noh<CR>'
    end, { expr = true })

    local kopts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap(
      'n',
      '=',
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.api.nvim_set_keymap(
      'n',
      '-',
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.api.nvim_set_keymap(
      'n',
      '*',
      [[*<Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.api.nvim_set_keymap(
      'n',
      '#',
      [[#<Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.api.nvim_set_keymap(
      'n',
      'g*',
      [[g*<Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.api.nvim_set_keymap(
      'n',
      'g#',
      [[g#<Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.api.nvim_set_keymap('n', '<Leader>nh', '<Cmd>noh<CR>', kopts)
  end,
}
