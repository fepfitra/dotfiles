export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
fn scream_or_not(should_scream) {
	print(should_scream);
  if should_scream {
    get_yolk_text().to_upper()
  } else {
    get_yolk_text().to_lower()
  }
}

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
		fonts: #{
			targets: "~/.local/share/fonts",
			enabled: true,
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
		i3: #{
			targets: "~/.config/i3",
			enabled: false,
			templates: ["config"],
			unsafe_shell_hooks: #{
				pre_deploy: "cp ./eggs/i3/config.template ./eggs/i3/config",
				post_deploy: "yay -Sy i3 i3lock-fancy-git --noconfirm",
				post_undeploy: "yay -R i3 i3lock-fancy-git --noconfirm",
			}
		},
		nushell: #{
			targets: "~/.config/nushell",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy nushell --noconfirm",
				post_undeploy: "yay -R nushell --noconfirm",
			}
		},
		"nvim-v1": #{
			targets: "~/.config/nvim-v1",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy neovim --noconfirm",
				post_undeploy: "yay -R neovim --noconfirm",
			}
		},
		picom: #{
			targets: "~/.config/picom",
			enabled: false,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy picom --noconfirm",
				post_undeploy: "yay -R picom --noconfirm",
			}
		},
		pip: #{
			targets: "~/.config/pip",
		},
		qutebrowser: #{
			targets: "~/.config/qutebrowser",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy qutebrowser --noconfirm",
				post_undeploy: "yay -R qutebrowser --noconfirm",
			}
		},
		rofi_conf: #{
			targets: "~/.config/rofi",
			enabled: true,
			unsafe_shell_hooks: #{
				post_deploy: "yay -Sy rofi --noconfirm",
				post_undeploy: "yay -R rofi --noconfirm",
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
				post_deploy: "yay -Sy swayfx --noconfirm",
				post_undeploy: "yay -R swayfx --noconfirm",
			}
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
