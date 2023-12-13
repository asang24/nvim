return {
	"stevearc/conform.nvim",
	-- event = "VeryLazy",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
			-- log_level = vim.log.levels.ERROR,
			-- notify_on_error = true,
			formatters_by_ft = {
				lua = { "stylua" },
				go = {
					formatters = { "gofumpt", "goimports", "golines" },
					run_all_formatters = true,
				},
				json = { "prettier" },
				yaml = { "prettier" },
				sql = { "sql-formatter" },
				markdown = { "prettier" },
			},
		})
	end,
}
