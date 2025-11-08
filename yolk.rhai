export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
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
};
eggs.mixin(dev::dev);
eggs.mixin(editor::editor);
eggs.mixin(wmdesktop::wmdesktop);
eggs.mixin(workflow::workflow);

export eggs;
