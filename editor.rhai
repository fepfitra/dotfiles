import "helper" as helper;

export let editor = #{
	typst: #{
		enabled: true,
		targets: "~/.config/typst",
		unsafe_shell_hooks: helper::cargo_prescripts("typst-cli")
	},
	zathura: #{
		targets: "~/.config/zathura",
		enabled: true,
		unsafe_shell_hooks: #{
			pre_deploy: helper::arch_install("zathura zathura-pdf-mupdf") + " && " + "xdg-mime default org.pwmt.zathura.desktop application/pdf",
			pre_undeploy: helper::arch_uninstall("zathura zathura-pdf-mupdf")
		}
	},
	pandoc: #{
		targets: "~/.config/pandoc",
		enabled: false,
		unsafe_shell_hooks: helper::arch_prescripts("pandoc-cli")
	},
	mermaid: #{
		targets: "~/.config/mermaid",
		enabled: false,
		unsafe_shell_hooks: helper::arch_prescripts("mermaid-cli mermaid-filter")
	},
	onlyoffice: #{
		targets: "~/.config/onlyoffice",
		enabled: true,
		unsafe_shell_hooks: helper::arch_prescripts("onlyoffice-bin")
	},
	latex: #{
		enabled: true,
		targets: "~/.config/latex",
		unsafe_shell_hooks: helper::arch_prescripts("texlive-bin texlive-fontsrecommended texlive-latexextra texlive-latex texlive-latexrecommended texlive-basic texlive-plaingeneric texlive-pictures texlive-binextra texlive-xetex dvisvgm")
	},
	"nvim-v1": #{
		targets: "~/.config/nvim-v1",
		enabled: true,
		templates: ["init.lua"],
		unsafe_shell_hooks: #{
			pre_deploy: helper::arch_install("neovim ripgrep fd lua-language-server stylua delve markdownlint-cli rust-analyzer clang tinymist") + " && " + helper::bun_install("@astrojs/language-server @tailwindcss/language-server") + " && " + helper::uv_tool_install_with("ruff ty", "pwntools") + " && " + helper::uv_tool_install("pwntools"),
			pre_undeploy: helper::arch_uninstall("neovim ripgrep fd lua-language-server stylua delve markdownlint-cli rust-analyzer clang tinymist") + " && " + helper::bun_uninstall("@astrojs/language-server @tailwindcss/language-server") + " && " + helper::uv_tool_uninstall("ruff ty pwntools"),
		}
	},
	antigravity: #{
		targets: "~/.config/Antigravity",
		enabled: false,
		strategy: "merge",
		unsafe_shell_hooks: helper::arch_prescripts("antigravity")
	},
};
