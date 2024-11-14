return {
	"ZSnails/NeoNeedsKey",
	opts = {},
	cmd = { "ActivateNeovim" },
	config = function()
		-- require("NeoNeedsKey").setup()
		require("NeoNeedsKey").setup({
			timeout = 10,
			position = "bottom-right",
		})
	end,
}
