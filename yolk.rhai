export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
import "helper" as helper;
import "wmdesktop" as wmdesktop;
import "workflow" as workflow;
import "dev" as dev;

let eggs = #{
	fonts: #{
		targets: "~/.local/share/fonts",
		enabled: true,
	},
};
eggs.mixin(wmdesktop::wmdesktop);
eggs.mixin(workflow::workflow);
eggs.mixin(dev::dev);
export eggs;
