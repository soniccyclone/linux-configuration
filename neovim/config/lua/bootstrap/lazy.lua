local common = require("bootstrap.common")

common.run("lazy", function()
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
	require("lazy").setup({
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.4",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"rose-pine/neovim",
			name = "rose-pine",
			config = function()
				vim.cmd("colorscheme rose-pine")
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},
		{
			"theprimeagen/harpoon",
		},
		{
			"mbbill/undotree",
		},
		{
			"tpope/vim-fugitive",
		},
		-- DAP
		{ "mfussenegger/nvim-dap" },
		{ "mfussenegger/nvim-jdtls" },
		-- LSP Support
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"VonHeikemen/lsp-zero.nvim",
			branch = "v3.x",
			lazy = true,
			config = false,
		},
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
			},
		},
		-- Autocompletion
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				{ "L3MON4D3/LuaSnip" },
			},
		},
		{
			"onsails/lspkind.nvim",
		},
		-- Formatter
		{ "mhartington/formatter.nvim" },
		-- Hover
		{
			"lewis6991/hover.nvim",
			config = function()
				require("hover").setup({
					init = function()
						-- Require providers
						require("hover.providers.lsp")
						-- require('hover.providers.gh')
						-- require('hover.providers.gh_user')
						-- require('hover.providers.jira')
						require("hover.providers.man")
						-- require('hover.providers.dictionary')
					end,
					preview_opts = {
						border = "single",
					},
					-- Whether the contents of a currently open hover window should be moved
					-- to a :h preview-window when pressing the hover keymap.
					preview_window = false,
					title = true,
					mouse_providers = {
						"LSP",
					},
					mouse_delay = 1000,
				})

				-- Setup keymaps
				vim.keymap.set("n", "<leader>h", require("hover").hover, { desc = "hover.nvim" })
				vim.keymap.set("n", "<leader>sh", require("hover").hover_select, { desc = "hover.nvim (select)" })

				-- Mouse support
				vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
				vim.o.mousemoveevent = true
			end,
		},
		-- Comment highlighting
		{
			"folke/todo-comments.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {},
		},
		-- Tabline
		{
			"romgrk/barbar.nvim",
			dependencies = {
				"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
				"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
			},
			init = function()
				vim.g.barbar_auto_setup = false
			end,
			opts = {
				-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
				-- animation = true,
				-- insert_at_start = true,
				-- …etc.
			},
			version = "^1.0.0", -- optional: only update when a new 1.x version is released
		},
        -- Floaing terminal
        {
            'voldikss/vim-floaterm'
        },
	})
end)
