return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true

		local api = require("nvim-tree.api")
		vim.keymap.set("n", "<c-e>", api.tree.toggle)
		local function my_on_attach(bufnr)
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			-- default mappings
			api.config.mappings.default_on_attach(bufnr)
			-- custom mappings
			vim.keymap.set("n", "<c-e>", api.tree.toggle, opts("Toggle"))
			-- vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		end

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			actions = {
				open_file = { quit_on_open = true },
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			sort = {
				sorter = "name",
				folders_first = true,
				files_first = false,
			},
			filters = {
				-- set false to show hidden files
				dotfiles = false,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
		})
	end,
}
