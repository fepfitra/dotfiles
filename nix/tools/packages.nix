{ pkgs, ... }:

let
  tools = with pkgs; [
    stow
    systemctl-tui
    maim
    obs-studio
    onedriver
    scrot
  ];
in
  tools
