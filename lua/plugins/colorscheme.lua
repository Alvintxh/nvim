return {
	-- "ajmwagar/vim-deus",
	--"theniceboy/nvim-deus",
	--"folke/tokyonight.nvim",
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd([[colorscheme catppuccin-macchiato]])
	end,
}
