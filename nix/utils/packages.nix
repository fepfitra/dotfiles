{ pkgs, ... }:

let
  nixgl = import <nixgl> {};
  utils = with pkgs; [
    alsa-utils
    baobab
    bash
    bc
    btop
    curlFull
    feh
    ffmpeg-full
    fzf
    home-manager
    intel-media-driver
    kitty
    ncpamixer
    stow
    strace
    tabview
    testdisk
    tmux
    wineWowPackages.full
    zoxide
  ];
in
  utils ++ [nixgl.auto.nixGLDefault]
