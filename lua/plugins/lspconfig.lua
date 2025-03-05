return {
	"neovim/nvim-lspconfig",

	config = function()
		require("lsp.lua")
		require("lsp.latex")
		require("lsp.python")
		--require("lsp.cpp")
	end,
}



