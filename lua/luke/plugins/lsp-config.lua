return{
  {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup( {
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "clangd",
          "html",
          "dockerls",
          "jsonls",
          "jedi_language_server",
          "sqlls",
          "intelephense",
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup( {} )
      lspconfig.rust_analyzer.setup( {} )
      lspconfig.tsserver.setup( {} )
      lspconfig.clangd.setup( {} )
      lspconfig.html.setup( {} )
      lspconfig.dockerls.setup( {} )
      lspconfig.jsonls.setup( {} )
      lspconfig.jedi_language_server.setup( {} )
      lspconfig.sqlls.setup( {} )
      lspconfig.intelephense.setup( {} )
    end
  }
}
