return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "buffers",
			themable = true,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			indicator = {
				icon = "▎", -- this should be omitted if indicator style is not 'icon'
				-- style = 'icon' | 'underline' | 'none',
				style = "icon",
			},
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "center",
				},
			},

			show_buffer_close_icons = true,
			show_close_icon = true,
			enforce_regular_tabs = true,
			show_duplicate_prefix = true,
			tab_size = 16,
			padding = 0,
			separator_style = "thin",
		},
		highlights = {
			fill = {
				bg = "#1e1e2e", -- 整个背景色
			},
			background = {
				bg = "#1e1e2e", -- buffer 未选中背景色
			},
			buffer_selected = {
				bg = "#1e1e2e", -- buffer 选中背景色
				bold = true,
			},
			tab_selected = {
				bg = "#1e1e2e",
			},
		},
	},
}
