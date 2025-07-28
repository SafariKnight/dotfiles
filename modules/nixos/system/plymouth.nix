{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.modules.system.plymouth;
in {
  options = {
    modules.system.plymouth.enable = lib.mkEnableOption "Plymouth";
  };
  config = lib.mkIf cfg.enable {
    boot = {
      plymouth = {
        enable = true;
        theme = "hexagon";
        themePackages = with pkgs; [
          # By default we would install all themes
          (adi1090x-plymouth-themes.override {
            selected_themes = ["hexagon"];
          })
        ];
      };

      # https://wiki.nixos.org/wiki/Plymouth#Usage
      # Enable "Silent boot"
      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=auto"
        "plymouth.use-simpledrm"
      ];
      # Hide the OS choice for bootloaders.
      # It's still possible to open the bootloader list by pressing any key
      # It will just not appear on screen unless a key is pressed
      loader.timeout = 0;
    };
  };
}
