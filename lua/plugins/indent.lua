return{
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
					enable = true,
					use_treesitter = true,
					style = {
						{ fg = "#806d9c" },
					},
				},
				indent = {
					enable = true,
					chars = { "│", "¦", "┆", "┊", },
					use_treesitter = false,
				},
				blank = {
					enable = false,
				},
				line_num = {
					enable = true,
					use_treesitter = true,
				},
			})
	end
}
