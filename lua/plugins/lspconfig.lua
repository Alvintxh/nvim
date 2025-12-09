return {
	{
		"neovim/nvim-lspconfig",

		config = function()
			require("lsp.lua")
			require("lsp.latex")
			require("lsp.python")
			require("lsp.md")
			require("lsp.cpp")
			require("lsp.json")
			require("lsp.rust")
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {
			use_diagnostic_signs = true,
			action_keys = {
				close = "<esc>",
				previous = "u",
				next = "e",
			},
		},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
