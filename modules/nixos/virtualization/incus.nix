{
  lib,
  config,
  ...
}: let
  cfg = config.modules.virtualization.incus;
in {
  options.modules.virtualization.incus = {
    enable = lib.mkEnableOption "Incus";
  };
  config = lib.mkIf cfg.enable {
    networking.firewall.trustedInterfaces = [
      "incusbr0"
    ];
    virtualisation.incus.enable = true;
    networking.nftables.enable = true;
  };
}
