{
  lib,
  config,
  ...
}: let
  cfg = config.modules.keyboard.cmk-caws;
in {
  options = {
    modules.keyboard.cmk-caws.enable = lib.mkEnableOption "Colemake CAWS (Curl-Angle-Wide-Symbol)";
  };
  config = lib.mkIf cfg.enable {
    services.xserver.xkb = {
      layout = "cmk";
      extraLayouts.cmk = {
        description = "Colemak DH with Wide and Symbol mods (Colemak CAWS)";
        symbolsFile = ./cmk;
        languages = ["eng"];
      };
    };
    console.useXkbConfig = true;
  };
}
