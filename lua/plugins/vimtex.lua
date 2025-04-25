return {
	"lervag/vimtex",
	--ft = { 'tex', 'latex' }, -- 仅在编辑 TeX 文件时加载
	lazy = false, -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release

	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "sioyek"
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_parser_bib_backend = "bibtex"
		vim.g.vimtex_complete_cite = "simple"
		--vim.g.vimtex_complete_bib = 'simple'
		--vim.g.vimtex_complete_bib.match_str_fmt = 'match_str_fmt'
		vim.g.vimtex_compiler_latexmk_engines = { _ = "-xelatex" }
		vim.g.vimtex_compiler_latexmk = {
			executable = "latexmk",
			options = {
				"-xelatex",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local buf_ft = vim.bo.filetype
				if buf_ft == "tex" then
					vim.cmd("VimtexCompile")
				end
			end,
		})

		vim.g.vimtex_quickfix_ignore_filters = {
			"Font shape",
			"badness 10000",
			"Package hyperref Warning",
			"Underfull",
			"Overfull",
			"specifier changed to",
			"Token not allowed in a PDF string",
			"LaTeX Warning: Float too large for page",
			"contains only floats",
		}
	end,
}
