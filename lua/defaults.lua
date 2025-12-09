vim.o.relativenumber = true
vim.o.number = true
vim.o.cursorline = false
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
vim.wo.signcolumn = "yes"
vim.o.whichwrap = "<,>,[,]"
vim.o.cmdheight = 1
vim.g.deus_termcolors = 256

vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("texlab")
vim.lsp.enable("rust_analyzer")

vim.opt.fillchars = {
	eob = " ",
}
