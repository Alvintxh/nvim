return{
	"ajmwagar/vim-deus",
	--"theniceboy/nvim-deus",
	--"folke/tokyonight.nvim",
	lazy = false,
  	priority = 1000,
 	opts = {},
	config = function()
		vim.cmd([[colorscheme deus]])
	end,
}
