{
  config,
  lib,
  ...
}: let
  cfg = config.modules.hardware.graphics;
in {
  options.modules.hardware.graphics = {
    enable = lib.mkEnableOption "OpenGL";
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
