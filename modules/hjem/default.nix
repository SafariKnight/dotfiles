{
  inputs,
  lib,
  config,
  pkgs,
  self,
  ...
}: let
  cfg = config.modules.hjem;
in {
  options = {
    modules.hjem.enable = lib.mkEnableOption "hjem";
  };

  imports = [
    inputs.hjem.nixosModules.default
    inputs.impurity.nixosModules.impurity
    ./kareem
  ];

  config = lib.mkIf cfg.enable {
    impurity.configRoot = self;
    hjem = {
      clobberByDefault = true;
      linker = pkgs.smfh;
    };
  };
}
