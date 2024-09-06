return {
	"nvim-java/nvim-java",
	ft = "java",
	-- event = "BufReadPost",
	config = false,
	dependencies = {
		{
			"neovim/nvim-lspconfig",
			opts = {
				servers = {
					jdtls = {
						-- Your custom jdtls settings go here
						cmd = { "java-lsp.sh" }, -- Example: Command to start the jdtls server
						root_dir = function(fname)
							return require("lspconfig").util.root_pattern("pom.xml", "build.gradle", ".git")(fname)
								or vim.loop.os_homedir()
						end,
						settings = {
							java = {
								format = {
									enabled = true, -- Example: Enable formatting
								},
							},
						},
					},
				},
				setup = {
					jdtls = function()
						require("java").setup({
							-- Your custom nvim-java configuration goes here
							root_markers = {
								"settings.gradle",
								"settings.gradle.kts",
								"pom.xml",
								"build.gradle",
								"mvnw",
								"gradlew",
								"build.gradle",
								"build.gradle.kts",
								".git",
							},
							java_test = {
								enable = true,
							},
							java_debug_adapter = {
								enable = true,
							},
							jdk = {
								auto_install = true,
							},
							notifications = {
								dap = true,
							},
							verification = {
								invalid_order = true,
								duplicate_setup_calls = true,
								invalid_mason_registry = true,
							},
						})
					end,
				},
			},
		},
	},
}
