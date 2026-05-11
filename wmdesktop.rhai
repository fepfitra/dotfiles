import "helper" as helper;

export let wmdesktop = #{
	niri: #{
		targets: "~/.config/niri",
		enabled: true,
		templates: ["config.kdl"],
		unsafe_shell_hooks: #{
			pre_deploy: helper::arch_install("niri"),
		}
	},
	rofi: #{
		targets: #{
				"rofi_conf": "~/.config/rofi",
				"rofi_local": "~/.local/share/rofi",
		},
		enabled: true,
		unsafe_shell_hooks: helper::arch_prescripts("rofi")
	},
	tofi: #{
		targets: "~/.config/tofi",
		enabled: false,
		unsafe_shell_hooks: helper::arch_prescripts("tofi")
	},
	waybar: #{
		targets: "~/.config/waybar",
		enabled: true,
		templates: ["style.css"],
		unsafe_shell_hooks: #{
			pre_deploy: helper::arch_install("waybar ananicy-cpp doxygen"),
			pre_undeploy: helper::arch_uninstall("waybar"),
		}
	},
	fuzzel: #{
		targets: "~/.config",
		enabled: false,
		strategy: "merge",
		unsafe_shell_hooks: helper::arch_prescripts("fuzzel")
	},
	picom: #{
		targets: "~/.config/picom",
		enabled: false,
		unsafe_shell_hooks: helper::arch_prescripts("picom")
	},
	"xdg-desktop-portal": #{
		targets: "~/.config/xdg-desktop-portal",
		enabled: true,
		unsafe_shell_hooks: #{
			pre_deploy: helper::arch_install("xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk xdg-desktop-portal-gnome"),
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
			pre_deploy: helper::arch_install("sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg") + " && ./eggs/sddm/install.sh",
		}
	},
	vicinae: #{
		targets: "~/.config/vicinae",
		enabled: true,
		unsafe_shell_hooks: helper::arch_prescripts("vicinae")
	},
	satty: #{
		targets: "~/.config/satty",
		enabled: true,
		unsafe_shell_hooks: helper::arch_prescripts("satty")
	},
	feh: #{
		targets: "~/.config/feh",
		enabled: false,
		unsafe_shell_hooks: helper::arch_prescripts("feh")
	},
	fcitx5: #{
		targets: "~/.config/fcitx5",
		enabled: false,
		unsafe_shell_hooks: helper::arch_prescripts("fcitx5 fcitx5-mozc fcitx5-gtk fcitx5-qt fcitx5-configtool fcitx5-material-color")
	},
};
