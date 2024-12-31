return{
	{
    		"preservim/vim-markdown",
    		dependencies = { "godlygeek/tabular" },
    		ft = { "markdown" },
  	},


	{
		 "iamcco/markdown-preview.nvim",
    		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    		ft = { "markdown" },
    		build = function() vim.fn["mkdp#util#install"]() end,
	},

	{
    		"ellisonleao/glow.nvim",
    		config = function()
      		require("glow").setup({
        	width = 120,
      		})
    		end,
  	}
}


