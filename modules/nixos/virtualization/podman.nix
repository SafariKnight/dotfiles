{
  lib,
  config,
  ...
}: let
  cfg = config.modules.virtualization.podman;
in {
  options.modules.virtualization.podman = {
    enable = lib.mkEnableOption "Podman";
  };
  config = lib.mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
    };
  };
}
