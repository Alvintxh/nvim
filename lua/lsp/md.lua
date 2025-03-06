return {
  require'lspconfig'.markdown_oxide.setup{
    filetypes = { "markdown" },
    cmd = { "markdown-oxide" },
    root_dir = require'lspconfig'.util.root_pattern(".git", ".markdown-oxide"),
    settings = {
      markdown = {
        validate = true,
        lint = {
          enabled = true,
          rules = {
            "no-empty-links",
            "no-duplicate-headings",
            "no-missing-space-atx",
            "no-missing-space-setext",
            "no-multiple-toplevel-headings",
            "no-trailing-punctuation",
            "no-undefined-references",
            "no-unused-definitions",
          },
        },
        completion = {
          enabled = true,
        },
        hover = {
          enabled = true,
        },
      },
    },
    on_attach = function(client, bufnr)
      -- 自定义按键映射
      local opts = { noremap=true, silent=true }
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    end,
  }
}
