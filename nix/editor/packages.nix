{ pkgs, ... }:

let
  editor = with pkgs; [
    zotero
    onlyoffice-bin_latest
    neovim
    zathura
    texliveFull
    pandoc
    mermaid-cli
    mermaid-filter
  ];
in
  editor
