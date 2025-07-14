return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			-- 自动补全相关插件
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			-- Vsnip 代码片段引擎
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
		},
		config = function()
			-- LSP 配置
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- 配置语言服务器
			lspconfig.pyright.setup({ capabilities = capabilities }) -- Python
			lspconfig.texlab.setup({ capabilities = capabilities }) -- LaTeX
			lspconfig.lua_ls.setup({ capabilities = capabilities }) --lua
			lspconfig.markdown_oxide.setup({ capabilities = capabilities }) --md
			lspconfig.clangd.setup({ capabilities = capabilities }) --c/c++
			lspconfig.jsonls.setup({ capabilities = capabilities }) --json
		end,
	},
}
