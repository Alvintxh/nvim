return {
	"nvim-treesitter/playground",
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 1000,
		build = ":TSUpdate",
		--opts = function(_, opts)
		--	-- add more things to the ensure_installed table protecting against community packs modifying it
		--	opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
		--	-- "lua"
		--	 })
		--end,

		config = function()
			vim.opt.smartindent = false
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				sync_install = true,
				ensure_installed = {
					"markdown",
					"html",
					--	"javascript",
					--	"java",
					"json",
					"c",
					"bash",
					"lua",
					"vim",
					"yaml",
					"latex",
					"python",
				},
				highlight = {
					enable = true,
					disable = {}, -- list of language that will be disabled
				},
				indent = {
					enable = true,
					disable = function(lang)
						local disallowed_filetypes = { "yaml", "dart" }
						return vim.tbl_contains(disallowed_filetypes, lang)
					end,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-n>",
						node_incremental = "<c-n>",
						node_decremental = "<c-h>",
						scope_incremental = "<c-l>",
					},
				},
			})
		end,
	},
}
