{ pkgs, ... }:

let
  fun = with pkgs; [
    asciiquarium
    fortune
    screenkey
  ];
in
  fun
