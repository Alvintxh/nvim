return {
	"neovim/nvim-lspconfig",

	config = function()
		require("lsp.lua")
		require("lsp.latex")
		require("lsp.python")
		require("lsp.md")
		--require("lsp.cpp")
	end,
}



