export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
export let eggs = #{
		alacritty: #{
			targets: "~/.config/alacritty",
			enabled: false,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy alacritty --noconfirm",
				post_undeploy: "yay -R alacritty --noconfirm",
			}
		},
		fish: #{
			targets: "~/.config/fish",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy fish fisher --noconfirm",
				post_undeploy: "yay -R fish fisher --noconfirm",
			}
		},
		fuzzel: #{
			targets: "~/.config",
			enabled: false,
			strategy: "merge",
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy fuzzel --noconfirm",
				post_undeploy: "yay -R fuzzel --noconfirm",
			}
		},
		git: #{
			targets: "~",
			enabled: true,
			strategy: "merge"
		},
		tofi: #{
			targets: "~/.config/tofi",
			enabled: false,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy tofi --noconfirm",
				post_undeploy: "yay -R tofi --noconfirm",
			}
		},
		starship: #{
			targets: "~/.config",
			enabled: true,
			strategy: "merge",
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy starship --noconfirm",
				post_undeploy: "yay -R starship --noconfirm",
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
				post_deploy: "yay -Sy waybar ananicy-cpp doxygen --noconfirm",
				post_undeploy: "yay -R waybar --noconfirm",
			}
		},
		zathura: #{
			targets: "~/.config/zathurarc",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy zathura --noconfirm",
				post_undeploy: "yay -R zathura --noconfirm",
			}
		},
};
