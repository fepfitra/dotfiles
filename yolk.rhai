export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
export let eggs = #{
		alacritty: #{
			targets: "~/.config/alacritty",
			templates: ["./alacritty/alacritty.toml"],
			enabled: true,
		},
		fish: #{
			targets: "~/.config/fish",
			templates: ["./fish/*"],
			enabled: true,
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
			enabled: true,
		},
		waybar: #{
			targets: "~/.config/waybar",
			templates: ["./waybar/*"],
			enabled: true,
		},
		zathura: #{
			targets: "~/.config/zathurarc",
			templates: ["./zathura/*"],
			enabled: true,
		},
};
