{ config, pkgs, ... }:
{
  home.username = "fep";
  home.homeDirectory = "/home/fep";
  home.stateVersion = "20.09";

  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE="1";
  };

  home.packages = with pkgs; [
    texliveFull
    gitleaks
    armitage
    metasploit
    gau
    anki
    asciiquarium
    baobab
    bash
    btop
    burpsuite
    cloudflared
    dnsenum
    fastfetch
    ffmpeg-full
    fortune
    fzf
    google-chrome
    home-manager
    intel-media-driver
    kdenlive
    kitty
    korganizer
    # kpipewire
    pipewire
    maim
    mermaid-cli
    mermaid-filter
    # microsoft-edge-stable
    # mpv-with-scripts
    ncpamixer
    neovide
    neovim
    ngrok
    nix
    nuclei
    obs-studio
    onedriver
    opencv
    openjdk
    pandoc
    pipewire
    podman
    podman-compose
    podman-tui
    postman
    pwvucontrol
    qemu
    qutebrowser
    radare2
    rxvt-unicode-unwrapped
    screenkey
    sqlmap
    stow
    strace
    systemctl-tui
    tabview
    termshark
    testdisk
    tmux
    wireshark-qt
    zathura
    zoxide
  ];
}
