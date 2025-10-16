return {
	vim.lsp.config("pyright", {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_dir = vim.fs.root(0, { ".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt" }),
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					autoImportCompletions = true,
					diagnostics = {
						enable = true,
						enableSemanticAnalysis = true,
					},
				},
			},
		},
	})
}
