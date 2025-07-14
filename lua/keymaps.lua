vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<F2>", ":NvimTreeToggle<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<F3>", ":Lazy<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F4>", ":InstantMarkdownPreview<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rc", ":RunCode<CR>", { noremap = true, silent = true })
