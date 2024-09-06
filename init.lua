require("vim-options")
require("luke.lazy")
require("luke.core")
require("luke.core.keymaps")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	severity = {
		min = vim.diagnostic.severity.WARNING,
	},
})
