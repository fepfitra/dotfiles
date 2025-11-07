export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
export let eggs = #{
		alacritty: #{
			targets: "~/.config/alacritty",
			enabled: false,
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy alacritty --noconfirm",
				post_undeploy: "paru -R alacritty --noconfirm",
			}
		},
		fish: #{
			targets: "~/.config/fish",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy fish fisher --noconfirm",
				post_undeploy: "paru -R fish fisher --noconfirm",
			}
		},
		fonts: #{
			targets: "~/.local/share/fonts",
			enabled: true,
		},
		fuzzel: #{
			targets: "~/.config",
			enabled: false,
			strategy: "merge",
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy fuzzel --noconfirm",
				post_undeploy: "paru -R fuzzel --noconfirm",
			}
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
				post_deploy: "paru -Sy i3 i3lock-fancy-git --noconfirm",
				post_undeploy: "paru -R i3 i3lock-fancy-git --noconfirm",
			}
		},
		niri: #{
			targets: "~/.config/niri",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy niri --noconfirm",
			}
		},
		nushell: #{
			targets: "~/.config/nushell",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy nushell --noconfirm",
				post_undeploy: "paru -R nushell --noconfirm",
			}
		},
		"nvim-v1": #{
			targets: "~/.config/nvim-v1",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy neovim --noconfirm",
				post_undeploy: "paru -R neovim --noconfirm",
			}
		},
		picom: #{
			targets: "~/.config/picom",
			enabled: false,
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy picom --noconfirm",
				post_undeploy: "paru -R picom --noconfirm",
			}
		},
		pip: #{
			targets: "~/.config/pip",
		},
		qutebrowser: #{
			targets: "~/.config/qutebrowser",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy qutebrowser --noconfirm",
				post_undeploy: "paru -R qutebrowser --noconfirm",
			}
		},
		rofi_conf: #{
			targets: "~/.config/rofi",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy rofi --noconfirm",
				post_undeploy: "paru -R rofi --noconfirm",
			}
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
				post_deploy: "paru -Sy swayfx --noconfirm",
				post_undeploy: "paru -R swayfx --noconfirm",
			}
		},
		tofi: #{
			targets: "~/.config/tofi",
			enabled: false,
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy tofi --noconfirm",
				post_undeploy: "paru -R tofi --noconfirm",
			}
		},
		starship: #{
			targets: "~/.config",
			enabled: true,
			strategy: "merge",
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy starship --noconfirm",
				post_undeploy: "paru -R starship --noconfirm",
			}
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
				post_deploy: "paru -Sy waybar ananicy-cpp doxygen --noconfirm",
				post_undeploy: "paru -R waybar --noconfirm",
			}
		},
		zathura: #{
			targets: "~/.config/zathurarc",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "paru -Sy zathura --noconfirm",
				post_undeploy: "paru -R zathura --noconfirm",
			}
		},
};
