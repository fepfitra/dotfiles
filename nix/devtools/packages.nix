{ pkgs, ... }:

let
  devtools = with pkgs; [
    cloudflared
    gh
    ngrok
    opencv
    openjdk
    podman
    podman-compose
    podman-tui
    postman
    qemu
    systemctl-tui
  ];
in
  devtools
