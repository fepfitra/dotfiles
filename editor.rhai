import "helper" as helper;

export let editor = #{
	typst: #{
		enabled: false,
		targets: "~/.config/typst",
		unsafe_shell_hooks: helper::cargo_postscripts("typst-cli")
	},
	zathura: #{
		targets: "~/.config/zathurarc",
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
	latex: #{
		enabled: false,
		targets: "~/.config/latex",
		unsafe_shell_hooks: helper::pkg_postscripts("texlive-bin texlive-fontsrecommended texlive-latexextra texlive-latex texlive-latexrecommended texlive-basic texlive-plaingeneric texlive-pictures texlive-binextra texlive-xetex dvisvgm")
	},
	"nvim-v1": #{
		targets: "~/.config/nvim-v1",
		enabled: true,
		unsafe_shell_hooks: helper::pkg_postscripts("neovim")
	},
};
