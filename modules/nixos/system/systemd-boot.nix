{
  lib,
  config,
  ...
}: let
  cfg = config.modules.system.systemd-boot;
in {
  options = {
    modules.system.systemd-boot.enable = lib.mkEnableOption "systemd-boot";
  };
  config = lib.mkIf cfg.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
