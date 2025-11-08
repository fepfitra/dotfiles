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
}
