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
					width = 30,
				},
			})
			-- open the tree
			--require("nvim-tree.api").tree.open()

			vim.api.nvim_create_autocmd({ "QuitPre" }, {
				callback = function()
					vim.cmd("NvimTreeClose")
				end,
			})
		end,
	},

	{
		"airblade/vim-rooter",
		init = function()
			vim.g.rooter_patterns = { "__vim_project_root", ".git/" }
			vim.g.rooter_silent_chdir = true
			-- set an autocmd
			vim.api.nvim_create_autocmd("VimEnter", {
				pattern = "*",
				callback = function()
					-- source .vim.lua at project root
					vim.cmd([[silent! source .vim.lua]])
				end,
			})
		end,
	},
}
