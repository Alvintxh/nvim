return{
  	"lervag/vimtex",
	ft = { 'tex', 'latex' }, -- 仅在编辑 TeX 文件时加载
  	--lazy = false,     -- we don't want to lazy load VimTeX
  	-- tag = "v2.15", -- uncomment to pin to a specific release

  	init = function()
    	-- VimTeX configuration goes here, e.g.
    		vim.g.vimtex_view_method = 'zathura'
		vim.g.vimtex_compiler_method = 'latexmk'
		vim.g.vimtex_compiler_latexmk = {
  			build_dir = '',
  			callback = 1,
  			continuous = 1,
  			executable = 'latexmk',
  			options = {
    				'-xelatex',
    				'-file-line-error',
    				'-synctex=1',
    				'-interaction=nonstopmode',
  			},
		}

  	end
}
