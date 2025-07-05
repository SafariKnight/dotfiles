{
  config,
  lib,
  ...
}: let
  cfg = config.modules.hardware.pipewire;
in {
  options.modules.hardware.pipewire = {
    enable = lib.mkEnableOption "Pipewire";
  };

  config = lib.mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
