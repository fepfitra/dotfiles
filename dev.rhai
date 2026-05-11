import "helper" as helper;

export let dev = #{
	git: #{
		targets: "~",
		enabled: true,
		strategy: "merge"
	},
	pip: #{
		targets: "~/.config/pip",
		enabled: true,
	},
	sqlite: #{
		targets: "~/.config/sqlite",
		enabled: true,
		unsafe_shell_hooks: helper::arch_prescripts("sqlite sqlitebrowser")
	},
	ruff: #{
		targets: "~/.config/ruff",
		enabled: true,
	},
	ty: #{
		targets: "~/.config/ty",
		enabled: true,
	},
	bacon: #{
		targets: "~/.config/bacon",
		enabled: false,
		unsafe_shell_hooks: helper::cargo_prescripts("bacon")
	},
}
