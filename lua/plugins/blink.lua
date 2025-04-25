return {
	"saghen/blink.cmp",
	event = { "BufReadPost", "BufNewFile" },
	version = "1.*",
	dependencies = {
		"xzbdmw/colorful-menu.nvim",
		config = function()
			require("colorful-menu").setup({
				ls = {
					lua_ls = { arguments_hl = "@comment" },
					clangd = {
						extra_info_hl = "@comment",
					},
					pyright = {
						extra_info_hl = "@comment",
					},
					fallback = true,
				},
				fallback_highlight = "@variable",
				max_width = 60,
			})
		end,
	},

	config = function()
		require("blink.cmp").setup({
			sources = {
				-- default = { 'lsp', 'path', 'snippets', 'buffer' },
				providers = {
					snippets = { score_offset = 1000 },
				},
			},
			signature = {
				window = { border = "single" },
			},
			cmdline = {
				completion = {
					menu = {
						auto_show = true,
					},
				},
			},
			completion = {
				menu = {
					border = "single",
					draw = {
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				},
				documentation = {
					window = { border = "single" },
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
			keymap = {
				-- Confirm selection with Enter
				["<CR>"] = { "accept", "fallback" },

				-- Scroll documentation
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
			},
		})
	end,
}
