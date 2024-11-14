return {
	{
		"numToStr/FTerm.nvim",
		config = function()
			require("FTerm").setup({
				border = "double",
        cmd = "fish",
				dimensions = {
					height = 0.9,
					width = 0.9,
				},
			})
			-- require("FTerm").run("fish")

			vim.keymap.set("n", "<C-\\>", '<CMD>lua require("FTerm").toggle()<CR>')
			vim.keymap.set("t", "<C-\\>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

		end,
	},
}
