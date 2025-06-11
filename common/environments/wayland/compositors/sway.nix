{ pkgs, ... }:
{
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true; # Needed for GTK apps
    };
  };

  security.polkit.enable = true; # System permissions
}
