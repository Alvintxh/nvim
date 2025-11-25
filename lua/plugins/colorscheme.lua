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
		-- 先用 opts 初始化主题
		require("catppuccin").setup(opts)

		-- 再设定 colorscheme
		vim.cmd.colorscheme("catppuccin-mocha")

		-- 如果还想更“干净”一点，可以手动把这些也设成透明（可选）
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
