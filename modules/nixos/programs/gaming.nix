{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.programs.gaming;
in {
  options.modules.programs.gaming = {
    enable = lib.mkEnableOption "Gaming";
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
    };
    programs.gamescope = {
      enable = true;
    };
    programs.fuse.userAllowOther = true;

    environment.systemPackages = with pkgs; [
      dwarfs
      fuse-overlayfs
      bubblewrap
      gamescope
      gamemode
      vkbasalt
      vkbasalt-cli
      mangohud
      protonup-qt
      lutris
      heroic
      osu-lazer-bin
      protonplus
      temurin-jre-bin-21
    ];
  };
}
