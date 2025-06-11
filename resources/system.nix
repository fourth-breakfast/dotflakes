{ ... }:
{
  # System state version (install version)
  system.stateVersion = "24.11";



  # Nix configuration
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
