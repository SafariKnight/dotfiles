{
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.modules.nix.index;
in {
  options = {
    modules.nix.index.enable = lib.mkEnableOption "nix-index";
    modules.nix.index.comma.enable = lib.mkEnableOption "comma";
  };

  imports = [
    inputs.nix-index-database.nixosModules.nix-index
  ];

  config = {
    programs.nix-index.enable = cfg.enable;
    programs.nix-index-database.comma.enable = cfg.enable && cfg.comma.enable;
  };
}
