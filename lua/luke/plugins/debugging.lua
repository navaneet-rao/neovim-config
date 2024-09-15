-- TODO: redo the dap for go and c/c++
--
-- FIX: DAP does NOT work need to fix it --

return {
	{
		"nvim-neotest/nvim-nio",
		lazy = true,
		event = "BufReadPost",
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
		},

		config = function()
			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			--TODO: dapui doesn't work with neotest
			require("dapui").setup()
			require("dap-go").setup({
				dap.adapters.delve == {
					type = "server",
					port = "38697",
					executable = {
						command = "dlv",
						args = { "dap", "-l", "127.0.0.1:38697" },
					},
				},
				dap.configurations.go == {
					{
						type = "delve",
						name = "Debug",
						request = "launch",
						program = "${file}",
					},
					{
						type = "delve",
						name = "Debug test", -- configuration for debugging test files
						request = "launch",
						mode = "test",
						program = "${file}",
					},
					-- works with go.mod packages and sub packages
					{
						type = "delve",
						name = "Debug test (go.mod)",
						request = "launch",
						mode = "test",
						program = "./${relativeFileDirname}",
					},
				},
			})

			vim.keymap.set("n", "<F5>", dap.continue, {})
			vim.keymap.set("n", "<F10>", dap.step_over, {})
			vim.keymap.set("n", "<F11>", dap.step_into, {})
			vim.keymap.set("n", "<F12>", dap.step_out, {})
			vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<Leader>B", dap.set_breakpoint, {})
			vim.keymap.set("n", "<Leader>lp", function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end)
			vim.keymap.set("n", "<Leader>dr", function()
				require("dap").repl.open()
			end)
			vim.keymap.set("n", "<Leader>dl", function()
				require("dap").run_last()
			end)
		end,
	},
}
