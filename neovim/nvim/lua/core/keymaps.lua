vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>") -- list keymaps
keymap.set("n", "<leader>fj", "<cmd>Telescope file_browser<cr>")
-- dap
keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
keymap.set("n", "<F6>", function()
	require("dap").step_over()
end)
keymap.set("n", "<F7>", function()
	require("dap").step_into()
end)
keymap.set("n", "<F8>", function()
	require("dap").step_out()
end)
keymap.set("n", "<F9>", function()
	require("dap").terminate()
end)
keymap.set("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)
keymap.set({ "n", "v" }, "<Leader>dt", function()
	require("dapui").toggle()
end)
keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
