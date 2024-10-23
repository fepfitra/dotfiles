{ config, pkgs, ... }:
let
  editor = import ./editor/packages.nix { inherit pkgs; };
  pentest = import ./pentest/packages.nix { inherit pkgs; };
  utils = import ./utils/packages.nix { inherit pkgs; };
  fun = import ./fun/packages.nix { inherit pkgs; };
  devtools = import ./devtools/packages.nix { inherit pkgs; };
in 
{
  home.username = "fep";
  home.homeDirectory = "/home/fep";
  home.stateVersion = "24.05";

  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE="1";
  };


  imports = [
    ./utils/fastfetch.nix
    # ./nixvim.nix
  ];

  home.packages = with pkgs; [
    # fastfetch
    # kpipewire
    # microsoft-edge-stable
    # mpv-with-scripts
    anki
    google-chrome
    kdenlive
    korganizer
    maim
    nix
    obs-studio
    onedriver
    qutebrowser
    screenkey
  ] 
  ++ pentest
  ++ editor
  ++ utils
  ++ fun
  ;

}
