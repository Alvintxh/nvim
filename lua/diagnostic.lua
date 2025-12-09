-- 自定义不同级别的图标（需要 Nerd Font / 图标字体）
local icons = {
	[vim.diagnostic.severity.ERROR] = "", -- Error
	[vim.diagnostic.severity.WARN] = "", -- Warn
	[vim.diagnostic.severity.INFO] = "", -- Info
	[vim.diagnostic.severity.HINT] = "", -- Hint
}

vim.diagnostic.config({
	virtual_text = {
		prefix = function(diagnostic)
			local icon = icons[diagnostic.severity] or ""
			return icon .. " "
		end,
		spacing = 5,
		source = "if_many",
	},

	-- sign 栏的小图标（可选）
	--signs = {
	--	text = icons,
	--},
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})
