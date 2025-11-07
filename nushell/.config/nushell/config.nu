# config.nu
#
# Installed by:
# version = "0.107.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

## ${UserConfigDir}/nushell/env.nu
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional;
mkdir $"($nu.cache-dir)"
carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

source ~/.zoxide.nu

alias nvim = env NVIM_APPNAME=nvim-v1 nvim
alias n1 = nvim

# alias cdtemp = cd (mktemp -d)
alias cddot = cd ~/GitProject/dotfiles/
alias la = ls -la
alias rm = trash
alias ff = fastfetch
alias cat = bat
alias cd = z
alias yy = yolk --yolk-dir . sync

fortune
print "\n"
^echo "scale=100; 4*a(1)" | bc -l

def --env cdtemp [name?:string] {
	match $name {
		null => {
			let dir = (mktemp -d)
			cd $dir
		}
		_ => {
			let dir = (mktemp -d -t $"($name).XXX")
			cd $dir
		}
	}
}

use std/util "path add"
path add '~/.bun/bin'
path add '~/.nix-profile/bin'	

$env.config.hooks = {
	env_change: {
		PWD: [
			{|before, after|
				tmux rename-window (basename ($after))
				def is_in_git [path] {
					try {
						git -C $path rev-parse --is-inside-work-tree err> /dev/null | into bool --relaxed
					} catch {
						return false
					}
				}
				def top_level [path] {
					try {
						git -C $path rev-parse --show-toplevel err> /dev/null | into string 
					} catch {
						return ""
					}
				}
				if (is_in_git $after) {
					if (not (is_in_git $before)) {
						print (onefetch)
					} else if (top_level $after) != (top_level $before) {
						print (onefetch)
					}
				}
			}
		]
	}
}

def ipaste [path:string] {
	wl-paste  -t image/png o> $path e> /dev/null
}

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

let fish_completer = {|spans|
    fish --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {|row|
      let value = $row.value
      let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
      if ($need_quote and ($value | path exists)) {
        let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
        $'"($expanded_path | str replace --all "\"" "\\\"")"'
      } else {$value}
    }
}
$env.config.edit_mode = 'vi'
$env.config.completions.external = {
	enable: true
	max_results: 100
	completer: $fish_completer
}
$env.config.show_banner = false
$env.config.history = {
  file_format: sqlite
  max_size: 1_000_000
  sync_on_enter: true
  isolation: true
}
