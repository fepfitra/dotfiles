import "helper" as helper;

export let wmdesktop = #{
	niri: #{
		targets: "~/.config/niri",
		enabled: true,
		templates: ["config.kdl"],
		unsafe_shell_hooks: #{
			post_deploy: helper::pkg_install("niri"),
		}
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
	sway: #{
		targets: "~/.config/sway",
		enabled: false,
		templates: ["config"],
		unsafe_shell_hooks: #{
			pre_deploy: "cp ./eggs/sway/config.template ./eggs/sway/config", //broken fix later
			post_deploy: helper::pkg_postscripts("swayfx")
		}
	},
	rofi: #{
		targets: #{
				"rofi_conf": "~/.config/rofi",
				"rofi_local": "~/.local/share/rofi",
		},
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("rofi")
	},
	tofi: #{
		targets: "~/.config/tofi",
		enabled: false,
		unsafe_shell_hooks: helper::pkg_postscripts("tofi")
	},
	waybar: #{
		targets: "~/.config/waybar",
		enabled: true,
		templates: ["style.css"],
		unsafe_shell_hooks: #{
			post_deploy: helper::pkg_install("waybar ananicy-cpp doxygen"),
			post_undeploy: helper::pkg_uninstall("waybar"),
		}
	},
	fuzzel: #{
		targets: "~/.config",
		enabled: false,
		strategy: "merge",
		unsafe_shell_hooks: helper::pkg_postscripts("fuzzel")
	},
	picom: #{
		targets: "~/.config/picom",
		enabled: false,
		unsafe_shell_hooks: helper::pkg_postscripts("picom")
	},
	"xdg-desktop-portal": #{
		targets: "~/.config/xdg-desktop-portal",
		enabled: true,
		unsafe_shell_hooks: #{
			post_deploy: helper::pkg_install("xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk xdg-desktop-portal-gnome"),
		}
	},
	DankMaterialShell: #{
		targets: "~/.config/DankMaterialShell",
		enabled: true,
	},
	sddm: #{
		targets: "~/.local/share/yolk/sddm",
		enabled: true,
		unsafe_shell_hooks: #{
			post_deploy: helper::pkg_install("sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg") + " && ./eggs/sddm/install.sh",
		}
	},
	vicinae: #{
		targets: "~/.config/vicinae",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("vicinae")
	},
	satty: #{
		targets: "~/.config/satty",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("satty")
	},
	fcitx5: #{
		targets: "~/.config/fcitx5",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("fcitx5 fcitx5-mozc fcitx5-gtk fcitx5-qt fcitx5-configtool fcitx5-material-color")
	},
};
