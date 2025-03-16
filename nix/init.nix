{ config, pkgs, ... }:
let
  devtools = import ./devtools/packages.nix { inherit pkgs; };
  editor = import ./editor/packages.nix { inherit pkgs; };
  fun = import ./fun/packages.nix { inherit pkgs; };
  pentest = import ./pentest/packages.nix { inherit pkgs; };
  # tools = import ./tools/packages.nix { inherit pkgs; };
  utils = import ./utils/packages.nix { inherit pkgs; };
  prod = import ./prod/packages.nix { inherit pkgs; };
in 
{
  home.username = "fep";
  home.homeDirectory = "/home/fep";
  home.stateVersion = "24.05";

  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE="1";
  };

  # imports = [
  #   ./utils/fastfetch.nix
  # ];

  home.packages = with pkgs; [
    anki
    google-chrome
    kdenlive
    korganizer
    nix
    #qutebrowser
  ] 
  ++ editor
  ++ fun
  ++ pentest
  ++ prod
  # ++ tools
  ++ utils
  ;
}
