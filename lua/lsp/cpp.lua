return {
  vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = vim.fs.root(0, { "compile_commands.json", "compile_flags.txt", ".git" }),
  }),
}

