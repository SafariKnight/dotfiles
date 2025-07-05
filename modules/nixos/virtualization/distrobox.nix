{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.modules.virtualization.distrobox;
in {
  options.modules.virtualization.distrobox = {
    enable = lib.mkEnableOption "Distrobox";
  };
  config = lib.mkIf cfg.enable {
    modules.virtualization.docker.enable = lib.mkDefault true;

    environment.systemPackages = [pkgs.distrobox];
  };
}
