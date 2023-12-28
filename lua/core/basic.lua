--Color
vim.env.TERM = 'xterm-256color'
vim.opt.termguicolors = true
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.opt.background = 'dark'
-- vim.opt.signcolumn = "yes"

vim.opt.ttyfast = true
-- vim.opt.autochdir = true // 开启之后, 打开文件时会自动切换到文件所在的目录, 对telescope插件搜索文件有影响
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.number = true
vim.opt.relativenumber = false

-- Tabs & Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- Search Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.ttimeoutlen = 0
vim.opt.timeout = false
vim.opt.virtualedit = 'block'
vim.opt.conceallevel = 0
vim.opt.laststatus = 3

-- Backspace
vim.opt.backspace = 'indent,eol,start'
vim.opt.list = false
vim.opt.listchars = 'tab:»·,nbsp:+,extends:→,precedes:←'
vim.opt.cmdheight = 1
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.colorcolumn = '0'
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.g.netrw_browse_split = 3
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.opt.clipboard:append 'unnamedplus'
vim.opt.mouse:append 'a'
vim.opt.hlsearch = true
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.inccommand = 'nosplit'
vim.opt.grepprg = 'rg --vimgrep --no-heading'
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
-- vim.opt.breakindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.autoread = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 400
vim.opt.completeopt = 'menu,menuone,noselect,noinsert'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Folding
vim.opt.foldlevel = 20
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Utilize Treesitter folds

-- replace default diagnostic signs
-- more:https://neovim.io/doc/user/diagnostic.html#diagnostic-signs
local signs = { Error = '󰅚', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config {
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  virtual_text = true,
}

-- 光标回到上次位置
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    if vim.fn.line '\'"' > 0 and vim.fn.line '\'"' <= vim.fn.line '$' then
      vim.fn.setpos('.', vim.fn.getpos '\'"')
      vim.cmd 'silent! foldopen'
    end
  end,
})

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- 关闭新行注释
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = '*',
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }
  end,
})
