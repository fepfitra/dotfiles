{ pkgs, ... }:

let
  editor = with pkgs; [
    zotero
    onlyoffice-desktopeditors
    neovim
    zathura
    texliveFull
    pandoc
    mermaid-cli
    mermaid-filter
  ];
in
  editor
