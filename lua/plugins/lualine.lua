local colors = {
	--bg = "#2c323b",
	bg = "#24273a",
	fg = "#eaeaea",
	a = "#8aadf4",
	b = "#c6a0f6",
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = {
					normal = {
						a = { bg = colors.bg, fg = colors.a, gui = "bold" },
						b = { bg = colors.bg, fg = colors.b },
						c = { bg = colors.bg, fg = colors.fg },
					},
					inactive = {
						a = { bg = colors.bg, fg = colors.fg, gui = "bold" },
						b = { bg = colors.bg, fg = colors.fg },
						c = { bg = colors.bg, fg = colors.fg },
					},
				},
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "filename" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "encoding", "filesize", "filetype" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
