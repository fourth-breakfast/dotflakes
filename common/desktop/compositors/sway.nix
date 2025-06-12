{ pkgs, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  
  # Essential services for Sway
  security.polkit.enable = true;
  services.dbus.enable = true;

}