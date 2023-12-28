return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('conform').setup({
      format_on_save = {
        pattern = '.lua,*.json,*.yaml,*.md,*.go,*.sql,*.sh',
        async = false,
        timeout_ms = 500,
      },
      format_after_save = {
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofumpt', 'goimports', 'golines' },
        json = { 'prettierd' },
        yaml = { 'prettierd' },
        sql = { 'sql-formatter' },
        markdown = { 'prettierd' },
      },
    })
  end,
}
