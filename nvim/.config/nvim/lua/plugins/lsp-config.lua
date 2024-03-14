return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local servers = {
				"bashls",
				"clangd",
				"gopls",
				"html",
				"intelephense",
				"jsonls",
				"kotlin_language_server",
				"lemminx",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"tailwindcss",
				"tsserver",
				"yamlls",
			}

			for _, server in ipairs(servers) do
				lspconfig[server].setup({ capabilities = capabilities })
			end

			vim.keymap.set("n", "<C-h>", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<C-[>", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
