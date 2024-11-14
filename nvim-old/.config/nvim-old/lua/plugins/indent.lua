return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = function(_, opts)
		require("ibl").setup()
		return require("indent-rainbowline").make_opts(opts, {
			color_transparency = 0.15,
		})
	end,
	dependencies = {
		"TheGLander/indent-rainbowline.nvim",
	},
}
