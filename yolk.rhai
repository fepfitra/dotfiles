export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
import "helper" as helper;
import "wmdesktop" as wmdesktop;
import "workflow" as workflow;

export let eggs = #{
	i3			: wmdesktop::wmdesktop.i3,
	niri		: wmdesktop::wmdesktop.niri,
	rofi		: wmdesktop::wmdesktop.rofi,
	sway		: wmdesktop::wmdesktop.sway,
	tofi		: wmdesktop::wmdesktop.tofi,
	waybar	: wmdesktop::wmdesktop.waybar,
	fuzzel	: wmdesktop::wmdesktop.fuzzel,
	picom		: wmdesktop::wmdesktop.picom,

	alacritty		: workflow::workflow.alacritty,
	fish				: workflow::workflow.fish,
	nushell			: workflow::workflow.nushell,
	"nvim-v1"		: workflow::workflow.get("nvim-v1"), 
	starship		: workflow::workflow.starship,
	tmux				: workflow::workflow.tmux,
	zathura			: workflow::workflow.zathura,
	qutebrowser	: workflow::workflow.qutebrowser,
	fonts: #{
		targets: "~/.local/share/fonts",
		enabled: true,
	},
	git: #{
		targets: "~",
		enabled: true,
		strategy: "merge"
	},
	pip: #{
		targets: "~/.config/pip",
	},
};
