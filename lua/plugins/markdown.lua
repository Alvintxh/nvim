return {
	{
		"instant-markdown/vim-instant-markdown",
		ft = { "markdown" },
		build = "yarn install",
		config = function()
			vim.g.instant_markdown_autostart = 1
			vim.g.instant_markdown_mathjax = 1
			vim.g.instant_markdown_mermaid = 1
		end,
	},
}
