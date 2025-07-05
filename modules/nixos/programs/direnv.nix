{
  config,
  lib,
  ...
}: let
  cfg = config.modules.programs.direnv;
in {
  options.modules.programs.direnv = {
    enable = lib.mkEnableOption "Direnv";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };
}
