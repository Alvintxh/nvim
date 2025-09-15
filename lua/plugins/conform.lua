return {
	"stevearc/conform.nvim",
	init = function()
		vim.g.disable_autoformat = false
		vim.keymap.set("n", "<leader>tf", function()
			if vim.g.disable_autoformat then
				vim.g.disable_autoformat = false
				vim.notify("Autoformat is enabled", vim.log.levels.INFO)
			else
				vim.g.disable_autoformat = true
				vim.notify("Autoformat is disabled", vim.log.levels.WARN)
			end
		end, { desc = "Toggle autoformatting" })
	end,
	event = { "BufWritePre", "InsertEnter" },
	cmd = { "ConformInfo", "FormatEnable", "FormatDisable" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Format buffer",
		},
	},

	config = function()
		require("conform").setup({
			notify_on_error = true,
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return {
					timeout_ms = 1000,
					lsp_format = "fallback",
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				tex = { "tex-fmt" },
				python = { "yapf", "isort" },
				json = { "fixjson" },
				sh = { "shfmt" },
				rust = { "rustfmt" },
				markdown = { "prettierd", "cbfmt" },
			},
			formatters = {
				cbfmt = {
					command = "cbfmt",
					args = { "-w", "--config", vim.fn.expand("~") .. "/.config/cbfmt.toml", "$FILENAME" },
				},
				-- taplo = { command = "taplo", args = { "fmt", "--option", "indent_tables=false", "-" } },
			},
		})

		vim.api.nvim_create_user_command("ConformDisable", function(args)
			if args.bang then
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("ConformEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
