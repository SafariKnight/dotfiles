{
  lib,
  config,
  pkgs,
  ...
}: let
  zfsCompatibleKernelPackages =
    lib.filterAttrs (
      name: kernelPackages:
        (builtins.match "linux_[0-9]+_[0-9]+" name)
        != null
        && (builtins.tryEval kernelPackages).success
        && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken)
    )
    pkgs.linuxKernel.packages;
  latestKernelPackage = lib.last (
    lib.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (
      builtins.attrValues zfsCompatibleKernelPackages
    )
  );

  cfg = config.modules.system.zfs-kernel;
in {
  options = {
    modules.system.zfs-kernel.enable = lib.mkEnableOption "zfs-kernel";
  };
  config = lib.mkIf cfg.enable {
    boot.kernelPackages = latestKernelPackage;
  };
}
