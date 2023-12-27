return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({})
		local keyset = vim.keymap.set

		-- 当前文件的提交记录
		keyset("n", "<leader>dp", "<cmd>DiffviewOpen<cr>")
		keyset("n", "<leader>df", "<cmd>DiffviewFileHistory %<cr>")
		keyset("n", "<leader>dc", "<cmd>DiffviewClose<cr>")
	end,
}
