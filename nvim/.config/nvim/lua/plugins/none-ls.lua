return {
	"nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
        require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.erb_lint,
				-- null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,
				-- null_ls.builtins.formatting.bibtex_tidy,
				-- null_ls.builtins.formatting.latexindent,
			},
		})

		vim.keymap.set("n", "<C-s>", vim.lsp.buf.format, {})
	end,
}
