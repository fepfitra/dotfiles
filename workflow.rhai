import "helper" as helper;

export let workflow = #{
	alacritty: #{
		targets: "~/.config/alacritty",
		enabled: false,
		unsafe_shell_hooks: helper::pkg_postscripts("alacritty")
	},
	fish: #{
		targets: "~/.config/fish",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("fish fisher")
	},
	nushell: #{
		targets: "~/.config/nushell",
		enabled: true,
		unsafe_shell_hooks: #{
			post_deploy: helper::pkg_install("nushell"),
		}
	},
	"nvim-v1": #{
		targets: "~/.config/nvim-v1",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("neovim")
	},
	starship: #{
		targets: "~/.config",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: helper::pkg_postscripts("starship")
	},
	tmux: #{
		targets: "~",
		enabled: true,
		strategy: "merge"
	},
	zathura: #{
		targets: "~/.config/zathurarc",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("zathura zathura-pdf-mupdf")
	},
	qutebrowser: #{
		targets: "~/.config/qutebrowser",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("qutebrowser")
	},
}
