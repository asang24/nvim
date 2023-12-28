---@diagnostic disable: missing-fields
return {
  'nvim-neotest/neotest',
  event = 'VeryLazy',
  dependencies = {
    'nvim-neotest/neotest-go', -- Your other test adapters here
  },
  keys = {
    {
      '<leader>gt',
      function()
        require('neotest').summary.open()
        vim.cmd [[Neotest run]]
        -- require('neotest').run.run(vim.fn.expand('%'))
      end,
      desc = 'Neotest toggle',
    },
    {
      '<leader>tp',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = 'Neotest output_panel toggle',
    },
  },
  config = function()
    local neotest_ns = vim.api.nvim_create_namespace 'neotest'
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message
            :gsub('\n', ' ')
            :gsub('\t', ' ')
            :gsub('%s+', ' ')
            :gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)
    require('neotest').setup {
      -- your neotest config here
      adapters = { require 'neotest-go' },
    }
  end,
}
