return {
	"coffebar/neovim-project",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals")

		local conf = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<leader>d", "<CMD>Telescope neovim-project discover<CR>", conf)
		vim.api.nvim_set_keymap("n", "<leader>h", "<CMD>Telescope neovim-project history<CR>", conf)
	end,
	opts = {
		projects = { -- define project roots
			"~/Documents/Code/Project/*",
			"~/.config/*",
		},
	},
}
