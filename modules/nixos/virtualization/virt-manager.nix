{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.modules.virtualization.virt-manager;
in {
  options.modules.virtualization.virt-manager = {
    enable = lib.mkEnableOption "Virtual Machine Manager";
  };
  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [virtiofsd];
    };
    programs.virt-manager.enable = true;
  };
}
