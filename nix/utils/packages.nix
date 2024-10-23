{ pkgs, ... }:

let
  nixgl = import <nixgl> {};
  utils = with pkgs; [
    baobab
    bash
    btop
    ffmpeg-full
    fzf
    home-manager
    intel-media-driver
    ncpamixer
    pipewire
    pwvucontrol
    stow
    strace
    tabview
    testdisk
    tmux
    zoxide
    kitty
  ];
in
  utils ++ [nixgl.auto.nixGLDefault]
