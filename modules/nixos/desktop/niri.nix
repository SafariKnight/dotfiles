{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.desktop.niri;
in {
  options.modules.desktop.niri = {
    enable = lib.mkEnableOption "Niri WM";
  };

  config = lib.mkIf cfg.enable {
    modules.desktop.portal.enable = lib.mkDefault true;
    programs.niri.enable = true;

    xdg.portal = {
      extraPortals = [
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-gtk
      ];
      config = {
        niri."org.freedesktop.impl.portal.FileChooser" = "gtk";
        niri.default = "gnome";
        common.default = "gnome";
        obs.default = "gnome";
      };
    };
  };
}
