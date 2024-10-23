{ pkgs, ... }:

let
  devtools = with pkgs; [
    cloudflared
    ngrok
    openjdk
    podman
    podman-compose
    podman-tui
    postman
    qemu
    systemctl-tui
    opencv
  ];
in
  devtools
