return {
	require("lspconfig").rust_analyzer.setup {
		on_attach = function(client, bufnr)
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end,
		settings = {
			["rust-analyzer"] = {
				imports = {
					granularity = {
						group = "module",
					},
					prefix = "self",
				},
				cargo = {
					buildScripts = {
						enable = true,
					},
				},
				procMacro = {
					enable = true
				},
			}
		}
	}
}
