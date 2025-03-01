return{
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
					enable = true,
					--use_treesitter = false,
					style = {
						{ fg = "#806d9c" },
					},
				},
			indent = {
					enable = true,
					chars = { "│", "¦", "┆", "┊", },
					--use_treesitter = false,
				},
			blank = {
					enable = true,
				},
			line_num = {
					enable = true,
					--use_treesitter = false,
				},
			})
	end
}
