{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    ./disk-config.nix
  ];

  modules = {
    hjem.enable = true;
    keyboard = {
      keyd.enable = true;
      cmk-caws.enable = true;
    };
    nix = {
      ld.enable = true;
      index = {
        enable = true;
        comma.enable = true;
      };
      nh = {
        enable = true;
        flake = "/home/kareem/dotfiles";
      };
    };
    system = {
      greetd.enable = true;
      systemd-boot.enable = true;
      zfs-kernel.enable = true;
    };
  };

  qt.enable = true;

  programs.gnupg.agent.enable = true;

  programs.kdeconnect.enable = true;

  system.stateVersion = "25.05";

  networking.hostName = "krypton";
  networking.networkmanager.enable = true;
  time.timeZone = "Africa/Cairo";

  i18n.defaultLocale = "en_US.UTF-8";
  programs.niri.enable = true;

  programs.gpu-screen-recorder.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      niri."org.freedesktop.impl.portal.FileChooser" = "gtk";
      niri.default = "gnome";
      common.default = "gnome";
      obs.default = "gnome";
    };
  };
  networking.hostId = "f9bd4f45";

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.kareem = {
    enable = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
  };

  services.gvfs.enable = true;

  programs.steam.enable = true;
  programs.steam.extraCompatPackages = with pkgs; [
    proton-ge-bin
  ];
  programs.gamescope = {
    enable = true;
  };
  programs.fuse.userAllowOther = true;

  environment.systemPackages = with pkgs; [
    dwarfs
    fuse-overlayfs
    bubblewrap
    p7zip
    unzip
    unrar
    git
    cloudflared
    zed-editor
    gamescope
    gamemode
    vkbasalt
    vkbasalt-cli
    mangohud
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    kdePackages.dolphin
    qbittorrent
    inputs.quickshell.packages.${pkgs.system}.default
    wget
    kitty
    mediastreamer-openh264
    protonup-qt
    wineWowPackages.stable
    lutris
    heroic
    # temurin-jre-bin-8
    # temurin-jre-bin-17
    temurin-jre-bin-21
    osu-lazer-bin
  ];

  fileSystems."/mnt/hdd" = {
    device = "/dev/disk/by-uuid/4916caf0-5be2-4187-bdd5-722a13a19fa6";
    fsType = "btrfs";
    options = [
      "subvol=root"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/mnt/important" = {
    device = "/dev/disk/by-uuid/4916caf0-5be2-4187-bdd5-722a13a19fa6";
    fsType = "btrfs";
    options = [
      "subvol=important"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/mnt/dbg" = {
    device = "/dev/disk/by-uuid/4916caf0-5be2-4187-bdd5-722a13a19fa6";
    fsType = "btrfs";
    options = [
      "compress=zstd"
      "noatime"
    ];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
  };
}
