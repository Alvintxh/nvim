return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
        	lazy = false,

        	dependencies = {
            		"nvim-tree/nvim-web-devicons",
        	},

        	config = function()
            		require("nvim-tree").setup({
				view = {
    					width = 50,
  				},
			})
        	end,
	},

	{
		"airblade/vim-rooter",
		init = function()
			vim.g.rooter_patterns = { '__vim_project_root', '.git/' ,'=SDU_Paper','sdu_papers.md' }
			vim.g.rooter_silent_chdir = true
			-- set an autocmd
			vim.api.nvim_create_autocmd("VimEnter", {
				pattern = "*",
				callback = function()
					-- source .vim.lua at project root
					vim.cmd([[silent! source .vim.lua]])
				end,
			})
		end
	}
}
