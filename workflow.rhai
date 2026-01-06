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
		unsafe_shell_hooks: helper::pkg_postscripts("carapace-bin")
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
		unsafe_shell_hooks: helper::pkg_postscripts("onefetch")
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
	legcord: #{
		targets: "~/.config/legcord",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: #{
			post_deploy: helper::pkg_install("legcord-bin") + " && sudo sed -i 's/_OPTIONS=\"env ELECTRON_OZONE_PLATFORM_HINT=auto\"/export ELECTRON_OZONE_PLATFORM_HINT=auto/' /usr/bin/legcord && sudo sed -i 's/ \"\\${_OPTIONS}\"//g' /usr/bin/legcord",
			post_undeploy: helper::pkg_uninstall("legcord-bin"),
		}
	},
	beeper: #{
		targets: "~/.config/Beeper",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: helper::pkg_postscripts("beeper-v4-bin")
	},
	element: #{
		targets: "~/.config/Element",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: helper::pkg_postscripts("element-desktop")
	},
	bottles: #{
		targets: "~/.config/bottles",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: helper::pkg_postscripts("bottles")
	},
	"pacman-hooks": #{
		targets: "~/.local/share/yolk/pacman-hooks",
		enabled: true,
		unsafe_shell_hooks: #{
			post_deploy: helper::pkg_install("pacman-contrib") + " && sudo mkdir -p /etc/pacman.d/hooks && sudo cp ./eggs/pacman-hooks/90-paccache.hook /etc/pacman.d/hooks/",
			post_undeploy: "sudo rm /etc/pacman.d/hooks/90-paccache.hook"
		}
	},
}
