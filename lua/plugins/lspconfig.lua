return {
	"neovim/nvim-lspconfig",

	config = function()
		require("lsp.lua")
		require("lsp.latex")
	end,
}



