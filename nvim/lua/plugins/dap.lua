return {
	'mfussenegger/nvim-dap',
	dependences = {
		'rcarriga/nvim-dap-ui'
	},
	lazy = true,
	config = function()
		local dap = require("dap")
		require("eli.remap")
		local dapui = require("dapui")
		vim.keymap.set("n", "<leader>dt", ':DapToggleBreakpoint<CR>')
		vim.keymap.set("n", "<leader>dx", ':DapTerminate<CR>')
		vim.keymap.set("n", "<leader>dc", ':DapContinue<CR>')
		vim.keymap.set("n", "<leader>do", ':DapStepOver<CR>')
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
		dap.adapters.lldb = {
			type = 'executable',
			command = '/usr/bin/lldb',
			name = 'lldb'
		}

		dap.configurations.cpp = {
			{
				name = 'Launch',
				type = 'lldb',
				request = 'launch',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
				args = {},
			},

		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
}
