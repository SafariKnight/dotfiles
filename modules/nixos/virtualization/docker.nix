{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.modules.virtualization.docker;
in {
  options.modules.virtualization.docker = {
    enable = lib.mkEnableOption "Docker";
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.docker-init
    ];
    virtualisation.docker = {
      enable = false;
      extraOptions = "--iptables=False";
      rootless = {
        enable = true;
        setSocketVariable = true;
        daemon.settings = {
          dns = [
            "1.1.1.1"
            "1.0.0.1"
          ];
        };
      };
    };
  };
}
