import "helper" as helper;

export let workflow = #{
	alacritty: #{
		targets: "~/.config/alacritty",
		enabled: false,
		unsafe_shell_hooks: helper::arch_prescripts("alacritty")
	},
	carapace: #{
		targets: "~/.config/carapace",
		enabled: true,
		unsafe_shell_hooks: helper::arch_prescripts("carapace-bin")
	},
	fish: #{
		targets: "~/.config/fish",
		enabled: true,
		unsafe_shell_hooks: helper::arch_prescripts("fish fisher")
	},
	nushell: #{
		targets: "~/.config/nushell",
		enabled: true,
		unsafe_shell_hooks: #{
			pre_deploy: helper::arch_install("nushell"),
		}
	},
	onefetch: #{
		targets: "~/.config/onefetch",
		enabled: true,
		unsafe_shell_hooks: helper::arch_prescripts("onefetch")
	},
	starship: #{
		targets: "~/.config",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: helper::arch_prescripts("starship")
	},
	tmux: #{
		targets: "~",
		enabled: false,
		strategy: "merge",
		templates: [".tmux.conf"],
	},
	qutebrowser: #{
		targets: "~/.config/qutebrowser",
		enabled: true,
		unsafe_shell_hooks: helper::arch_prescripts("qutebrowser")
	},
	"zen-browser": #{
		targets: "~/.zen",
		enabled: true,
		strategy: "merge",
	},
	legcord: #{
		targets: "~/.config/legcord",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: #{
			pre_deploy: helper::arch_install("legcord-bin") + " && sudo sed -i 's/_OPTIONS=\"env ELECTRON_OZONE_PLATFORM_HINT=auto\"/export ELECTRON_OZONE_PLATFORM_HINT=auto/' /usr/bin/legcord && sudo sed -i 's/ \"\\${_OPTIONS}\"//g' /usr/bin/legcord",
			pre_undeploy: helper::arch_uninstall("legcord-bin"),
		}
	},
	beeper: #{
		targets: "~/.config/Beeper",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: helper::arch_prescripts("beeper-v4-bin")
	},
	element: #{
		targets: "~/.config/Element",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: helper::arch_prescripts("element-desktop")
	},
	bottles: #{
		targets: "~/.config/bottles",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: helper::arch_prescripts("bottles")
	},
	thunderbird: #{
		targets: "~/.thunderbird",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: helper::arch_prescripts("thunderbird")
	},
	megacmd: #{
		targets: "~/.megaCmd",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: helper::arch_prescripts("megacmd-bin")
	},
	anki: #{
		targets: "~/.local/share/Anki2",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: #{
			pre_deploy: helper::arch_install("anki-bin anki-debug") + " && mkdir -p ~/.local/bin && echo '#!/bin/sh' > ~/.local/bin/anki && echo 'PYTHONPATH=/usr/lib/python3.13/site-packages uv run --quiet --python 3.13 --with requests --with beautifulsoup4 --with flask --with protobuf --with waitress --with decorator --with PyQt6 --with PyQt6-WebEngine --with distro /usr/bin/anki \"$@\"' >> ~/.local/bin/anki && chmod +x ~/.local/bin/anki && mkdir -p ~/.local/share/applications && cp /usr/share/applications/anki.desktop ~/.local/share/applications/anki.desktop && sed -i 's|^Exec=.*|Exec=/home/fep/.local/bin/anki %f|' ~/.local/share/applications/anki.desktop && sed -i 's|^TryExec=.*|TryExec=/home/fep/.local/bin/anki|' ~/.local/share/applications/anki.desktop",
			pre_undeploy: helper::arch_uninstall("anki-bin anki-debug") + " && rm -f ~/.local/bin/anki && rm -f ~/.local/share/applications/anki.desktop"
		}
	},
	"pacman-hooks": #{
		targets: "~/.local/share/yolk/pacman-hooks",
		enabled: true,
		unsafe_shell_hooks: #{
			pre_deploy: helper::arch_install("pacman-contrib") + " && sudo mkdir -p /etc/pacman.d/hooks && sudo cp ./eggs/pacman-hooks/90-paccache.hook /etc/pacman.d/hooks/",
			pre_undeploy: "sudo rm /etc/pacman.d/hooks/90-paccache.hook"
		}
	},
}
