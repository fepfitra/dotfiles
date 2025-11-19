import "dev" as dev;
import "editor" as editor;
import "helper" as helper;
import "wmdesktop" as wmdesktop;
import "workflow" as workflow;
import "themes/themes" as themes;

export const theme = themes::themes["gruvbox_dark"];


let eggs = #{
	fonts: #{
		targets: "~/.local/share/fonts",
		enabled: true,
	},
	fun: #{
		targets: "~/.config/fun",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("timr-bin activate-linux")
	},
	cysec: #{
		targets: "~/.config/cysec",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("airgeddon airgrack-ng apkleaks steghide stegsolve sqlmap")
	},

};
eggs.mixin(dev::dev);
eggs.mixin(editor::editor);
eggs.mixin(wmdesktop::wmdesktop);
eggs.mixin(workflow::workflow);

export eggs;
