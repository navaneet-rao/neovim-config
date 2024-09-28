_G.LSPsList = {
	"lua_ls",
	"rust_analyzer",
	"clangd",
	"html",
	"dockerls",
	"jsonls",
	"pyright",
	"jedi_language_server",
	"sqlls",
	"intelephense",
	"cssls",
	"golangci_lint_ls",
	"gopls",
	"arduino_language_server",
	"asm_lsp",
	"tailwindcss",
	"neocmake",
	"cmake",
	"ast_grep",
	-- "harper_ls",
	"jdtls",
	"lemminx",
	"eslint",
	"gradle_ls",
	-- "ltex",
	"vtsls",
	"glint",
	"ts_ls",
	"prismals",
}

_G.java_runtimes = {}

if vim.fn.has("win32") == 1 then
	_G.java_runtimes = {
		{
			name = "JavaSE-21",
			path = "C:/Program Files/Java/jdk-21/bin",
			default = true,
		},
	}
else
	_G.java_runtimes = {
		{
			name = "JavaSE-17",
			path = "/usr/lib/jvm/java-17-openjdk-amd64",
			default = false,
		},
		{
			name = "JavaSE-11",
			path = "/usr/lib/jvm/java-11-openjdk-amd64",
			default = false,
		},
		{
			name = "JavaSE-19",
			path = "/usr/lib/jvm/java-19-openjdk-amd64",
			default = true,
		},
	}
end

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		after = "mason.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = _G.LSPsList,
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		after = "mason-lspconfig.nvim",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			---@diagnostic disable-next-line: unused-local
			local on_attach = function(client, bufnr)
				-- Existing on_attach setup, e.g., key mappings, etc.

				-- Set up clangd_extensions inlay hints
				require("clangd_extensions.inlay_hints").setup_autocmd()
				require("clangd_extensions.inlay_hints").set_inlay_hints()
			end

			-- Set up each LSP server using the global variable
			for _, server in ipairs(_G.LSPsList) do
				if lspconfig[server] then
					lspconfig[server].setup({ capabilities = capabilities })
				end
			end

			-- to generate the compile_commands.json to as below
			-- use the below commonf if ur using cmake eith ur c/c++ projects
			-- ---> cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
			-- ---> make
			--
			--  and for projects with only make use
			-- ---> bear -- make all

			lspconfig.clangd.setup({ capabilities = capabilities, on_attach = on_attach })

			lspconfig.jdtls.setup({
				-- jdtls requires min java vesion 0f 17
				capabilities = capabilities,
				settings = {
					java = {
						configuration = {
							runtimes = _G.java_runtimes,
						},
					},
				},
			})
		end,
	},
}
