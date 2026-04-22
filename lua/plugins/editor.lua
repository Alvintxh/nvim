return {
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				providers = {
					-- 'lsp',
					-- 'treesitter',
					"regex",
				},
			})
			vim.cmd("hi IlluminatedWordText guibg=#393E4D gui=none")
		end,
	},
	{
		"dkarter/bullets.vim",
		lazy = false,
		ft = { "markdown", "txt" },
	},
	-- {
	-- 	"psliwka/vim-smoothie",
	-- 	init = function()
	-- 		vim.cmd([[nnoremap <unique> <C-e> <cmd>call smoothie#do("\<C-D>") <CR>]])
	-- 		vim.cmd([[nnoremap <unique> <C-u> <cmd>call smoothie#do("\<C-U>") <CR>]])
	-- 	end
	-- },
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			-- 顶级配置项，用于隐藏警告
			suppress_deprecation = true,

			-- 新的结构化配置格式
			options = {
				-- 解析器配置
				parsers = {
					css = {
						RGB = true,
						RRGGBB = true,
						names = true,
						RRGGBBAA = false,
						AARRGGBB = true,
						rgb_fn = false,
						hsl_fn = false,
						css = false,
						css_fn = false,
					},
					tailwind = { enable = true },
					sass = { enable = false },
				},
				-- 显示配置
				display = {
					mode = "virtualtext",
					virtualtext = {
						text = "■", -- 显示的字符
						position = "inline", -- 显示位置，可选 "inline", "eol", "overlay"
					},
				},
			},

			-- 应用到所有文件类型
			filetypes = { "*" },
			-- 应用到所有缓冲区类型
			buftypes = {},
		},
	},

	{ "theniceboy/antovim", lazy = false },
	{ "gcmt/wildfire.vim", lazy = false },
	{
		"fedepujol/move.nvim",
		config = function()
			require("move").setup({
				line = {
					enable = true,
					indent = true,
				},
				block = {
					enable = true,
					indent = true,
				},
				word = {
					enable = false,
				},
				char = {
					enable = false,
				},
			})
			local opts = { noremap = true, silent = true }
			-- Normal-mode commands
			vim.keymap.set("n", "<c-y>", ":MoveLine(1)<CR>", opts)
			vim.keymap.set("n", "<c-l>", ":MoveLine(-1)<CR>", opts)

			-- Visual-mode commands
			vim.keymap.set("v", "<c-e>", ":MoveBlock(1)<CR>", opts)
			vim.keymap.set("v", "<c-u>", ":MoveBlock(-1)<CR>", opts)
		end,
	},
	{
		"gbprod/substitute.nvim",
		config = function()
			local substitute = require("substitute")
			substitute.setup({
				-- on_substitute = require("yanky.integration").substitute(),
				highlight_substituted_text = {
					enabled = true,
					timer = 200,
				},
			})
			vim.keymap.set("n", "s", substitute.operator, { noremap = true })
			vim.keymap.set("n", "sh", function()
				substitute.operator({ motion = "e" })
			end, { noremap = true })
			vim.keymap.set("x", "s", require("substitute.range").visual, { noremap = true })
			vim.keymap.set("n", "ss", substitute.line, { noremap = true })
			vim.keymap.set("n", "sI", substitute.eol, { noremap = true })
			vim.keymap.set("x", "s", substitute.visual, { noremap = true })
		end,
	},
	--	{
	--		"kevinhwang91/nvim-ufo",
	--		dependencies = { "kevinhwang91/promise-async", },
	--		config = function() require('ufo').setup() end
	--	},
	--	{
	--		"windwp/nvim-autopairs",
	--		config = function()
	--			require("nvim-autopairs").setup({})
	--		end
	--	},
}
