return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({})
		local keyset = vim.keymap.set

		-- 当前文件内查看记录
		keyset("n", "<leader>dt", ":diffthis<cr>")
		keyset("n", "<leader>do", ":diffoff<cr>")
		-- 当前文件的提交记录
		keyset("n", "<leader>df", "<cmd>DiffviewFileHistory %<cr>")
		keyset("n", "<leader>dc", "<cmd>DiffviewClose<cr>")
	end,
}
