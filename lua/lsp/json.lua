return {
  vim.lsp.config("jsonls", {
    on_attach = function(client, bufnr)
      -- 这里可以写 jsonls 特定的按键绑定或功能
      -- 暂时保留为空
    end,
  }),
}

