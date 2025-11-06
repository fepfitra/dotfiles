{ pkgs, ... }:

let
  prod = with pkgs; [
    telegram-desktop
    # whatsapp-for-linux
  ];
in
  prod
