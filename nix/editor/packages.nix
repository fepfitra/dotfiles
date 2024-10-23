{ pkgs, ... }:

let
  editor = with pkgs; [
    neovim
    zathura
    texliveFull
    pandoc
    mermaid-cli
    mermaid-filter
  ];
in
  editor
