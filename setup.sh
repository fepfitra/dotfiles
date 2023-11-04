makelink() {
    source_file="$1"
    target_file="$2"

    if [ -e "$target_file" ]; then
        mv "$target_file" "$target_file.old"
    fi

    ln -s "$(pwd)/$source_file" "$target_file"
}

# Example usage of the makelink function
makelink ".zshrc" "$HOME/.zshrc"
makelink ".tmux.conf" "$HOME/.tmux.conf"
makelink ".dwm" "$HOME/.dwm"
makelink "picom" "$HOME/.config/picom"
makelink "alacritty" "$HOME/.config/alacritty"
