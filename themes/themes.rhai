
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
		waybar: #{
            transparent_bg: gruvbox::gruvbox.dark0_hard, 
            main_fg: gruvbox::gruvbox.light1,
            main_bg: gruvbox::gruvbox.dark1,
            alt_bg: gruvbox::gruvbox.dark0,
            border: gruvbox::gruvbox.dark0_hard,
            ws_inactive_fg: gruvbox::gruvbox.gray,
            ws_active_bg: gruvbox::gruvbox.dark0_hard,
            ws_focused_fg: gruvbox::gruvbox.light1,
            ws_focused_bg: gruvbox::gruvbox.light0,
            ws_urgent_bg: gruvbox::gruvbox.bright_aqua,
            red: gruvbox::gruvbox.bright_red,
            green_aqua: gruvbox::gruvbox.bright_aqua,
            orange: gruvbox::gruvbox.bright_orange,
            yellow: gruvbox::gruvbox.bright_yellow,
            blue: gruvbox::gruvbox.bright_blue,
            purple: gruvbox::gruvbox.bright_purple,
            green: gruvbox::gruvbox.bright_green,
            warning: gruvbox::gruvbox.neutral_orange,
            critical: gruvbox::gruvbox.bright_red,
        },
		niri: #{
            focus_active: gruvbox::gruvbox.bright_blue,
            focus_inactive: gruvbox::gruvbox.dark2,
            border_active: gruvbox::gruvbox.bright_orange,
            border_inactive: gruvbox::gruvbox.dark2,
            shadow_color: gruvbox::gruvbox.dark0_hard + "77",
        }
    }
}
