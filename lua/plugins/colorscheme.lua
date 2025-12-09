return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = "mocha",
		transparent_background = true,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin-mocha")
		local groups = {
			"Normal",
			"NormalNC",
			"SignColumn",
			"LineNr",
			"EndOfBuffer",
			"NormalFloat",
			"FloatBorder",
		}
		for _, group in ipairs(groups) do
			pcall(vim.api.nvim_set_hl, 0, group, { bg = "none" })
		end
	end,
}
