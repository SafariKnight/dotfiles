{
  lib,
  config,
  ...
}: let
  cfg = config.modules.virtualization.docker;
in {
  options.modules.virtualization.docker = {
    enable = lib.mkEnableOption "Docker";
  };
  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = false;

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}
