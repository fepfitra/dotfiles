import "helper" as helper;

export let workflow = #{
	alacritty: #{
		targets: "~/.config/alacritty",
		enabled: false,
		unsafe_shell_hooks: helper::pkg_postscripts("alacritty")
	},
	carapace: #{
		targets: "~/.config/carapace",
		enabled: true,
		unsafe_shell_hooks: #{
			pre_deploy: "mkdir -p eggs/carapace",
			post_deploy: helper::pkg_install("carapace-bin"),
			post_undeploy: helper::pkg_uninstall("carapace-bin"),
		}
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
	onefetch: #{
		targets: "~/.config/onefetch",
		enabled: true,
		unsafe_shell_hooks: #{
			pre_deploy: "mkdir -p eggs/onefetch",
			post_deploy: helper::pkg_install("onefetch"),
			post_undeploy: helper::pkg_uninstall("onefetch"),
		}
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
		strategy: "merge",
		templates: [".tmux.conf"],
	},
	qutebrowser: #{
		targets: "~/.config/qutebrowser",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("qutebrowser")
	},
}
