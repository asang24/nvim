return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end
    require('lualine').setup({
      options = {
        theme = 'auto',
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', icons_enabled = true, separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = {
          'branch',
          {
            'diff',
            symbols = { added = '+', modified = '~', removed = '-' },
            source = diff_source,
          },
          {
            'filename',
            file_status = true,
            path = 1,
            symbols = { modified = ' [+]', readonly = ' ', unnamed = '', newfile = '[New]' },
          },
        },

        lualine_c = { 'encoding' },
        lualine_x = {
          {
            'fileformat',
            icons_enabled = true,
            symbols = {
              unix = 'LF',
              dos = 'CRLF',
              mac = 'CR',
            },
          },
        },
        lualine_y = { '%3{codeium#GetStatusString()}' },
        lualine_z = { { 'filetype', colored = true, icon_only = false, icon = { align = 'left' } }, 'progress' },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
