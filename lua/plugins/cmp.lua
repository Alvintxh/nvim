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

        -- 配置语言服务器（按需修改）
        lspconfig.pyright.setup { capabilities = capabilities }  -- Python
        lspconfig.texlab.setup { capabilities = capabilities } -- LaTeX
 	lspconfig.lua_ls.setup{capabilities = capabilities} --lua
	lspconfig.markdown_oxide.setup{capabilities = capabilities} --md
	--lspconfig.clangd.setup{capabilities = capabilities} --c/c++
    end
  },

  -- 自动补全核心配置
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- 使用 vsnip 引擎
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },    -- vsnip 代码片段
        }, {
          { name = "buffer" },   -- 缓冲区内容
          { name = "path" },     -- 文件路径
        })
      })

      -- 命令行自动补全
      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })

      cmp.setup.cmdline({ "/", "?" }, {
        sources = {
          { name = "buffer" }
        }
      })
    end
  },

  -- 代码片段引擎
  { "hrsh7th/vim-vsnip", event = "InsertEnter" },
  { "hrsh7th/cmp-vsnip", dependencies = "vim-vsnip" },

  -- 其他可选插件（保持注释状态）
  --[[ 
  -- LuaSnip 示例配置
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = "L3MON4D3/LuaSnip"
  },
  --]]
}
