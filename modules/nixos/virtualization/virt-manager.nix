{
  lib,
  config,
  ...
}: let
  cfg = config.modules.virtualization.virt-manager;
in {
  options.modules.virtualization.virt-manager = {
    enable = lib.mkEnableOption "Virtual Machine Manager";
  };
  config = lib.mkIf cfg.enable {
    networking.firewall.trustedInterfaces = [
      "virbr0"
    ];
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    # environment.systemPackages = [
    #   pkgs.qemu
    # ];
    # virtualisation.libvirtd = {
    #   enable = true;
    #   extraConfig = ''
    #     firewall_backend = "iptables"
    #   '';
    #   qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    # };
    #
    # programs.virt-manager.enable = true;
  };
}
