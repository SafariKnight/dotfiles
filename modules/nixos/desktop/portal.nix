{
  config,
  lib,
  ...
}: let
  cfg = config.modules.desktop.portal;
in {
  options.modules.desktop.portal = {
    enable = lib.mkEnableOption "XDG Portals";
  };

  config = lib.mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
  };
}
