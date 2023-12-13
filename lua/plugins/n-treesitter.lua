---@diagnostic disable: missing-fields
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 1000,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"go",
					"gomod",
					"lua",
					"vim",
					"json",
					"markdown",
					"markdown_inline",
					"sql",
					"yaml",
					"dockerfile",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false, -- disable standard vim highlighting
				},
				indent = { enable = true },
				incremental_selection = { enable = true },
				context_commentstring = { enable = true, enable_autocmd = false },
				query_linter = {
					enable = true,
					use_virtual_text = true,
					lint_events = { "BufWrite", "CursorHold" },
				},
				sync_install = true,
				auto_install = true,
				autotag = {
					enable = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/playground",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			local tscontext = require("treesitter-context")
			tscontext.setup({
				enable = true,
				max_lines = 0,
				min_window_height = 0,
				line_numbers = true,
				multiline_threshold = 20,
				trim_scope = "outer",
				mode = "cursor",
				separator = nil,
				zindex = 20,
				on_attach = nil,
			})
			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context()
			end, { silent = true })
		end,
	},
}
