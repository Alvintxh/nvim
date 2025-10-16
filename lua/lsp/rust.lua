return {
	vim.lsp.config("rust_analyzer", {
		on_attach = function(client, bufnr)
			-- 启用 inlay hints
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
					enable = true,
				},
			},
		},
	}),
}
