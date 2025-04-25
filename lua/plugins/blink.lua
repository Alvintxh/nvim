return {
	--[[	"saghen/blink.cmp",
	event = { "BufReadPost", "BufNewFile" },
	version = "1.*",
	dependencies = {
		"xzbdmw/colorful-menu.nvim",
		"hrsh7th/nvim-cmp", -- Ensure nvim-cmp is available
		"L3MON4D3/LuaSnip", -- Snippet support
	},

	config = function()
		--	local cmp = require("cmp")
		--	local blink_cmp = require("blink.cmp")

		-- Configure colorful-menu
		require("colorful-menu").setup({
			ls = {
				lua_ls = { arguments_hl = "@comment" },
				clangd = { extra_info_hl = "@comment" },
				basedpyright = { extra_info_hl = "@comment" },
				fallback = true,
			},
			fallback_highlight = "@variable",
			max_width = 60,
		})

		-- Setup blink.cmp with enhanced keymaps and sources
		require("blink.cmp").setup({
			sources = {
				{ name = "nvim_lsp" }, -- LSP completions
				{ name = "luasnip" }, -- Snippet completions
				{ name = "buffer" }, -- Buffer words
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = require("cmp").mapping.preset.insert({
				["<CR>"] = require("cmp").mapping.confirm({ select = true }), -- Confirm selection with Enter
				["<C-u>"] = require("cmp").mapping.scroll_docs(-4), -- Scroll up docs
				["<C-d>"] = require("cmp").mapping.scroll_docs(4), -- Scroll down docs
				["<C-Space>"] = require("cmp").mapping.complete(), -- Trigger completion
				["<C-e>"] = require("cmp").mapping.abort(), -- Abort completion
			}),
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
		})
	end,]]
}
