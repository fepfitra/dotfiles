
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
            // Original: rgba(21, 18, 27, 0)
            transparent_bg: gruvbox::gruvbox.dark0_hard, 
            // Original: #cdd6f4
            main_fg: gruvbox::gruvbox.light1,
            // Original: #1e1e2e
            main_bg: gruvbox::gruvbox.dark1,
            // Original: #11111b
            alt_bg: gruvbox::gruvbox.dark0,
            // Original: #181825
            border: gruvbox::gruvbox.dark0_hard,
            // Original: #636777
            ws_inactive_fg: gruvbox::gruvbox.gray,
            // Original: #000
            ws_active_bg: gruvbox::gruvbox.dark0_hard,
            // Original: #a6adc8
            ws_focused_fg: gruvbox::gruvbox.light1,
            // Original: #ffffff
            ws_focused_bg: gruvbox::gruvbox.light0,
            // Original: #a6e3a1 (urgent)
            ws_urgent_bg: gruvbox::gruvbox.bright_aqua,
            // Original: #eba0ac
            red: gruvbox::gruvbox.bright_red,
            // Original: #a6e3a1 (power)
            green_aqua: gruvbox::gruvbox.bright_aqua,
            // Original: #fab387
            orange: gruvbox::gruvbox.bright_orange,
            // Original: #f9e2af
            yellow: gruvbox::gruvbox.bright_yellow,
            // Original: #89b4fa
            blue: gruvbox::gruvbox.bright_blue,
            // Original: #cba6f7
            purple: gruvbox::gruvbox.bright_purple,
            // Original: #a6e3a1 (battery)
            green: gruvbox::gruvbox.bright_green,
            // Original: #FFA500
            warning: gruvbox::gruvbox.neutral_orange,
            // Original: #F00
            critical: gruvbox::gruvbox.bright_red,
        },
		niri: #{
            // focus-ring active
            focus_active: gruvbox::gruvbox.bright_blue,         // Original: #7fc8ff
            // focus-ring inactive
            focus_inactive: gruvbox::gruvbox.dark2,             // Original: #505050
            
            // border active
            border_active: gruvbox::gruvbox.bright_orange,      // Original: #ffc87f
            // border inactive
            border_inactive: gruvbox::gruvbox.dark2,            // Original: #505050
    
            // shadow color
            // Original: #0007 (shorthand for #00000077)
            shadow_color: gruvbox::gruvbox.dark0_hard + "77",
        }
    }
}
