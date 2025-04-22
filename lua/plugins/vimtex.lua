return{
  	"lervag/vimtex",
	--ft = { 'tex', 'latex' }, -- 仅在编辑 TeX 文件时加载
  	lazy = false,     -- we don't want to lazy load VimTeX
  	-- tag = "v2.15", -- uncomment to pin to a specific release

  	init = function()
    	-- VimTeX configuration goes here, e.g.
    		vim.g.vimtex_view_method = 'skim'
		vim.g.vimtex_compiler_method = 'latexmk'
		vim.g.vimtex_parser_bib_backend = 'bibtex'
		vim.g.vimtex_complete_cite = 'simple'
	        --vim.g.vimtex_complete_bib = 'simple'
		--vim.g.vimtex_complete_bib.match_str_fmt = 'match_str_fmt'
		vim.g.vimtex_compiler_latexmk_engines = { _ = '-xelatex' }
		vim.g.vimtex_compiler_latexmk = {
  			executable = 'latexmk',
  			options = {
    				'-xelatex',
				'-file-line-error',
            		   	'-synctex=1',
            	  		'-interaction=nonstopmode',
  			},
		}

		vim.g.vimtex_quickfix_ignore_filters = {
			'Font shape',
			"badness 10000",
			"Package hyperref Warning",
		}

  	end
}
