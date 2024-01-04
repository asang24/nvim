---@diagnostic disable: missing-fields
return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-emoji',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'onsails/lspkind.nvim',
  },
  config = function()
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    local luasnip = require('luasnip')
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    require('luasnip.loaders.from_vscode').lazy_load()
    cmp.setup({
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          menu = {
            buffer = '[Buffer]',
            nvim_lsp = '[LSP]',
            luasnip = '[LuaSnip]',
            nvim_lua = '[Lua]',
            emoji = '[Emoji]',
            latex_symbols = '[Latex]',
          },
        }),
      },
      enabled = function()
        if
          require('cmp.config.context').in_treesitter_capture('comment') == true
          or require('cmp.config.context').in_syntax_group('Comment')
        then
          return false
        else
          return true
        end
      end,
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
        completion = {
          winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
          col_offset = -3,
          side_padding = 0,
          border = 'rounded',
          scrollbar = true,
        },
        documentation = {
          winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
          border = 'rounded',
          scrollbar = true,
        },
      },
      experimental = {
        ghost_text = false,
        git = {
          async = true,
        },
      },
      preselect = cmp.PreselectMode.Item,
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip', option = { show_autosnippets = true } },
        { name = 'nvim_lsp_signature_help' },
      }, { { name = 'buffer' } }),

      -- 根据文件类型补全
      cmp.setup.filetype({ 'TelescopePrompt' }, {
        sources = cmp.config.sources({
          { name = 'buffer' },
        }),
      }),
      cmp.setup.filetype({ 'vim', 'markdown' }, {
        sources = cmp.config.sources({
          { name = 'buffer' },
        }),
      }),
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'buffer' },
        }),
      }),
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp_document_symbol' },
      },
      view = {
        entries = { name = 'wildmenu', separator = '|' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
      }),
    })
  end,
}
