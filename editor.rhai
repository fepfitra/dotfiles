import "helper" as helper;

export let editor = #{
	typst: #{
		enabled: false,
		targets: "~/.config/typst",
		unsafe_shell_hooks: helper::cargo_postscripts("typst-cli")
	},
	zathura: #{
		targets: "~/.config/zathura",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("zathura zathura-pdf-mupdf")
	},
	pandoc: #{
		targets: "~/.config/pandoc",
		enabled: false,
		unsafe_shell_hooks: helper::pkg_postscripts("pandoc-cli")
	},
	mermaid: #{
		targets: "~/.config/mermaid",
		enabled: false,
		unsafe_shell_hooks: helper::pkg_postscripts("mermaid-cli mermaid-filter")
	},
	onlyoffice: #{
		targets: "~/.config/onlyoffice",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("onlyoffice-bin")
	},
	latex: #{
		enabled: true,
		targets: "~/.config/latex",
		unsafe_shell_hooks: helper::pkg_postscripts("texlive-bin texlive-fontsrecommended texlive-latexextra texlive-latex texlive-latexrecommended texlive-basic texlive-plaingeneric texlive-pictures texlive-binextra texlive-xetex dvisvgm")
	},
	"nvim-v1": #{
		targets: "~/.config/nvim-v1",
		enabled: true,
		templates: ["init.lua"],
		unsafe_shell_hooks: helper::pkg_postscripts("neovim ripgrep fd")
	},
	antigravity: #{
		targets: "~/.config/Antigravity",
		enabled: true,
		strategy: "merge",
		unsafe_shell_hooks: helper::pkg_postscripts("antigravity")
	},
};
