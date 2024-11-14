{ pkgs, ... }:

let
  fun = with pkgs; [
    asciiquarium
    fortune
    screenkey
    # cava
  ];
in
  fun
