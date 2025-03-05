return{
	require'lspconfig'.pyright.setup{
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_dir = require'lspconfig'.util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt"),
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
	}
}
