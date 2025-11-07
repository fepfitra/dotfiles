export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
import "helper" as helper;
export let eggs = #{
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
	fonts: #{
		targets: "~/.local/share/fonts",
		enabled: true,
	},
	fuzzel: #{
		targets: "~/.config",
		enabled: false,
		strategy: "merge",
		unsafe_shell_hooks: helper::pkg_postscripts("fuzzel")
	},
	git: #{
		targets: "~",
		enabled: true,
		strategy: "merge"
	},
	i3: #{
		targets: "~/.config/i3",
		enabled: false,
		templates: ["config"],
		unsafe_shell_hooks: #{
			pre_deploy: "cp ./eggs/i3/config.template ./eggs/i3/config",
			post_deploy: helper::pkg_install("i3 i3lock-fancy-git")
		}
	},
	niri: #{
		targets: "~/.config/niri",
		enabled: true,
		unsafe_shell_hooks: #{
			post_deploy: helper::pkg_postscripts("niri")
		}
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
	picom: #{
		targets: "~/.config/picom",
		enabled: false,
		unsafe_shell_hooks: helper::pkg_postscripts("picom")
	},
	pip: #{
		targets: "~/.config/pip",
	},
	qutebrowser: #{
		targets: "~/.config/qutebrowser",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("qutebrowser")
	},
	rofi_conf: #{
		targets: "~/.config/rofi",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("rofi")
	},
	rofi_local: #{
		targets: "~/.local/share/rofi",
		enabled: true,
	},
	sway: #{
		targets: "~/.config/sway",
		enabled: false,
		templates: ["config"],
		unsafe_shell_hooks: #{
			pre_deploy: "cp ./eggs/sway/config.template ./eggs/sway/config", //broken fix later
			post_deploy: helper::pkg_postscripts("swayfx")
		}
	},
	tofi: #{
		targets: "~/.config/tofi",
		enabled: false,
		unsafe_shell_hooks: helper::pkg_postscripts("tofi")
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
	waybar: #{
		targets: "~/.config/waybar",
		enabled: true,
		unsafe_shell_hooks: #{
			post_deploy: helper::pkg_install("waybar ananicy-cpp doxygen"),
			post_undeploy: helper::pkg_uninstall("waybar"),
		}
	},
	zathura: #{
		targets: "~/.config/zathurarc",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("zathura")
	},
};
