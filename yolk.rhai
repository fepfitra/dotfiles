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
		waybar: #{
			targets: "~/.config/waybar",
			templates: ["./waybar/*"],
			enabled: true,
		},
};
