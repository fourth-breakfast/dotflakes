{ ... }:
{
  services.gnome.gnome-keyring.enable = true; # Credential storage
  programs.seahorse.enable = true; # GUI credential manager
}
