vim.lsp.config("jsonls", {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { "package.json", ".git" },
	init_options = {
		provideFormatter = true,
	},
	settings = {
		json = {
			schemas = (function()
				local ok, schemastore = pcall(require, "schemastore")
				if ok then
					return schemastore.json.schemas()
				else
					return {}
				end
			end)(),
			validate = { enable = true },
		},
	},
})
