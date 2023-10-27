local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	-- lua functions that many plugins use
	"nvim-lua/plenary.nvim",

	-- colorscheme
	"navarasu/onedark.nvim",

	-- tmux & split window navigation
	"christoomey/vim-tmux-navigator",

	-- maximizes and restores current window
	"szw/vim-maximizer",

	-- essential plugins
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",

	-- commenting with gc
	"numToStr/Comment.nvim",

	-- file explorer
	"nvim-tree/nvim-tree.lua",
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- icons
	"kyazdani42/nvim-web-devicons",

	-- statusline
	"nvim-lualine/lualine.nvim",

	-- fuzzy finding
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },

	-- autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp-signature-help",

	-- snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- managing and installing lsp servers
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	--configuring lsp servers
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	{ "glepnir/lspsaga.nvim", branch = "main" },
	"onsails/lspkind.nvim",

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		dependencies = {
			"windwp/nvim-autopairs",
		},
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" }, -- autoclose tags- treesitter

	-- git signs plugin
	"lewis6991/gitsigns.nvim",

	-- moving efficiently within the current window
	"ggandor/leap.nvim",

	-- add indentation guides to all lines
	"lukas-reineke/indent-blankline.nvim",

	-- colorize surrounding parenthesis / brackets
	"HiPhish/nvim-ts-rainbow2",

	-- move lines / characters with Alt
	"matze/vim-move",

	-- debug client / UI
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	"jay-babu/mason-nvim-dap.nvim",
})
