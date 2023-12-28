vim.g.mapleader = ' '

local opt = { noremap = true, silent = true }
local function keymap(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
end

-- Cancel s default function
keymap('n', 's', '')

-- Windows split screen shortcuts
keymap('n', 'sv', ':vsp<CR>')
keymap('n', 'sh', ':sp<CR>')
-- Close current
keymap('n', 'sc', '<C-w>c')
-- Close other
keymap('n', 'so', '<C-w>o')

-- hjkl jump between windows  instead of navigator
-- keymap("n", "wh", "<C-w>h")
-- keymap("n", "wj", "<C-w>j")
-- keymap("n", "wk", "<C-w>k")
-- keymap("n", "wl", "<C-w>l")

-- Indent code in visual mode  liek TAB  & S-TAB
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- 单行或多行移动
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

--
-- ctrl+s save
keymap('n', '<C-s>', ':w<CR>')
keymap('i', '<C-s>', '<ESC>:w<CR>')
keymap('n', '<leader>bd', ':bdelete<cr>')
keymap('n', '<leader>bn', ':bnext<cr>')
keymap('n', '<leader>bp', ':bprevious<cr>')
