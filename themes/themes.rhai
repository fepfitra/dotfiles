
//run '~/.tmux/plugins/tpm/tpm'
//set -g @nord_tmux_no_patched_font "1"
//set -g @nord_tmux_show_status_content "0"
//set -g status-style "bg=#{@color-bg-main},fg=#{@color-fg-main}"
//set -g status-left "#[fg=#{@color-accent-1},bg=#@color-accent-2,bold] #S "
//set -g status-right "#{prefix_highlight} #[bg=#{@color-accent-3},fg=#{@color-bg-dark},bold] #{USER} #[bg=#{@color-accent-2},fg=#{@color-accent-1},bold] #h "

import "./themes/gruvbox" as gruvbox;

export let themes = #{
    gruvbox_dark: #{
        tmux: #{
            status_style: #{
                bg: gruvbox::gruvbox.dark2,
                fg: gruvbox::gruvbox.light1,
            },
            status_left: #{
                fg: gruvbox::gruvbox.dark0,
                bg: gruvbox::gruvbox.bright_yellow,
            },
			status_user: #{
				fg: gruvbox::gruvbox.dark0,
				bg: gruvbox::gruvbox.bright_aqua,
			},
			status_host: #{
				fg: gruvbox::gruvbox.dark0,
				bg: gruvbox::gruvbox.bright_yellow,
			},
            window_status_inactive: #{
                fg: gruvbox::gruvbox.neutral_blue,
                bg: gruvbox::gruvbox.dark2,
            },
            window_status_current: #{
                fg: gruvbox::gruvbox.dark0,
                bg: gruvbox::gruvbox.bright_blue,
            },
			message_style: #{
                bg: gruvbox::gruvbox.dark0,
                fg: gruvbox::gruvbox.light1,
            },
            message_command_style: #{
                bg: gruvbox::gruvbox.dark0,
                fg: gruvbox::gruvbox.light1,
            },
        },
		nvim: #{
			colorscheme: "gruvbox",
			background: "dark",
		},
    }
}
