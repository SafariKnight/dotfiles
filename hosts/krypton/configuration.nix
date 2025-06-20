{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  zfsCompatibleKernelPackages =
    lib.filterAttrs (
      name: kernelPackages:
        (builtins.match "linux_[0-9]+_[0-9]+" name)
        != null
        && (builtins.tryEval kernelPackages).success
        && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken)
    )
    pkgs.linuxKernel.packages;
  latestKernelPackage = lib.last (
    lib.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (
      builtins.attrValues zfsCompatibleKernelPackages
    )
  );
in {
  imports = [
    inputs.disko.nixosModules.disko
    ./disk-config.nix

    ./keyd.nix
    ./greetd.nix

    inputs.nix-maid.nixosModules.default
    ./../../modules/maid

    inputs.nix-index-database.nixosModules.nix-index
  ];
  modules.greetd = {
    enable = true;
  };

  programs.nix-index-database.comma.enable = true;
  qt.enable = true;

  programs.command-not-found.enable = false;

  programs.gnupg.agent.enable = true;

  programs.kdeconnect.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = latestKernelPackage;

  system.stateVersion = "25.05";
  modules.keyboard.keyd.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/kareem/dotfiles";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "pipe-operators"
  ];

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

  services.xserver.xkb.extraLayouts.cmk = {
    description = "Colemak DH with Wide and Symbol mods (Colemak CAWS)";
    symbolsFile = ./cmk;
    languages = ["eng"];
  };
  services.xserver.xkb.layout = "cmk";
  console.useXkbConfig = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.kareem = {
    enable = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
  };

  programs.chromium.enable = true;
  services.gvfs.enable = true;

  programs.steam.enable = true;
  programs.steam.extraCompatPackages = with pkgs; [
    proton-ge-bin
  ];
  programs.gamescope = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    p7zip
    unzip
    unrar
    git
    cloudflared
    ungoogled-chromium
    neovim
    zed-editor
    gamescope
    mangohud
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    nemo
    qbittorrent
    inputs.quickshell.packages.${pkgs.system}.default
    wget
    kitty
    protonup-qt
    wineWowPackages.stable
    lutris
    heroic
    vivaldi
    temurin-jre-bin-8
    temurin-jre-bin-17
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

  # programs.nix-ld = {
  #   enable = true;
  #   libraries = with pkgs; [
  #     stdenv.cc.cc
  #     openssl
  #     curl
  #     glib
  #     util-linux
  #     glibc
  #     icu
  #     libunwind
  #     libuuid
  #     zlib
  #     libsecret
  #     # graphical
  #     freetype
  #     libglvnd
  #     libnotify
  #     SDL2
  #     vulkan-loader
  #     gdk-pixbuf
  #     xorg.libX11
  #   ];
  # };

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
