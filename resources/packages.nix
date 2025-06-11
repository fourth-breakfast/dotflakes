# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    keepassxc
    gitFull
    neovim
    vscode
    fish
    nixfmt-rfc-style
    pciutils
    hwdata
    gh
    thunderbird
    bitwarden-desktop
    libreoffice-qt6-fresh
    wl-clipboard
    mako
    kitty
    alacritty
    fish
    ghostty
    ly
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
