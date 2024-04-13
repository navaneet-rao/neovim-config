return {
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
          underline = true,
          virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
          },
          update_in_insert = true,
        }
      )
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end
  }

}
