export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
export let eggs = #{
		alacritty: #{
			targets: "~/.config/alacritty",
			templates: ["./alacritty/alacritty.toml"],
			enabled: false,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy alacritty --noconfirm",
				post_undeploy: "yay -R alacritty --noconfirm",
			}
		},
		fish: #{
			targets: "~/.config/fish",
			templates: ["./fish/*"],
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy fish fisher --noconfirm",
				post_undeploy: "yay -R fish fisher --noconfirm",
			}
		},
		git: #{
			targets: "~",
			templates: ["./git/*"],
			enabled: true,
			strategy: "merge"
		},
		tofi: #{
			targets: "~/.config/tofi",
			templates: ["./tofi/*"],
			enabled: false,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy tofi --noconfirm",
				post_undeploy: "yay -R tofi --noconfirm",
			}
		},
		starship: #{
			targets: "~/.config",
			templates: ["./starship/*"],
			enabled: true,
			strategy: "merge",
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy starship --noconfirm",
				post_undeploy: "yay -R starship --noconfirm",
			}
		},
		tmux: #{
			targets: "~",
			templates: ["./tmux/.tmux.conf"],
			enabled: true,
			strategy: "merge"
		},
		waybar: #{
			targets: "~/.config/waybar",
			templates: ["./waybar/*"],
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy waybar ananicy-cpp doxygen --noconfirm",
				post_undeploy: "yay -R waybar --noconfirm",
			}
		},
		zathura: #{
			targets: "~/.config/zathurarc",
			templates: ["./zathura/*"],
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy zathura --noconfirm",
				post_undeploy: "yay -R zathura --noconfirm",
			}
		},
};
