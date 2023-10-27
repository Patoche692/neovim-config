local dap, dapui = require("dap"), require("dapui")

local mason_dap = require("mason-nvim-dap")

if not mason_dap then
	print("Error loading mason-nvim-dap")
end

mason_dap.setup({
	ensure_installed = {
		"cppdbg",
		"debugpy",
	},
	automatic_installation = true,
})

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7", -- adjust as needed, must be absolute path
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
}
-- load launch.json file (if exists)
require("dap.ext.vscode").load_launchjs(vim.fn.getcwd() .. "/" .. "launch.json", { cppdbg = { "c", "cpp" } })

dap.configurations.c = dap.configurations.cpp

dapui.setup({
	mappings = {
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.7,
				},
				{
					id = "breakpoints",
					size = 0.3,
				},
			},
			size = 0.3,
			position = "right",
		},
		{
			elements = {
				{
					id = "repl",
					size = 0.3,
				},
				{
					id = "console",
					size = 0.7,
				},
			},
			size = 0.3,
			position = "bottom",
		},
	},
	floating = {
		max_height = nil,
		max_width = nil,
		border = "single",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil,
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- end

vim.fn.sign_define("DapBreakpoint", { text = "⭕️", texthl = "", linehl = "", numhl = "" })
