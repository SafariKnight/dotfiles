{
  lib,
  config,
  ...
}: let
  cfg = config.modules.nix.nh;
in {
  options = {
    modules.nix.nh.enable = lib.mkEnableOption "Nix Helper (nh)";
    modules.nix.nh.flake = lib.mkOption {
      description = lib.mdDoc "flake path";
      type = lib.types.nullOr lib.types.path;
    };
  };
  config = {
    programs.nh = {
      inherit (cfg) enable;
      inherit (cfg) flake;
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
    };
  };
}
