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

    security.wrappers.fusermount3 = {
      source = "${pkgs.fuse3}/bin/fusermount3";
      owner = "root";
      group = "root";
      setuid = true;
    };

    programs.gamescope = {
      enable = true;
    };
    programs.fuse.userAllowOther = true;

    environment.systemPackages = with pkgs; [
      dwarfs
      fuse3
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
      ryubing
    ];
  };
}
