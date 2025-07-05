{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    ./disk-config.nix
  ];

  system.stateVersion = "25.05";

  networking.hostName = "krypton";
  time.timeZone = "Africa/Cairo";

  i18n.defaultLocale = "en_US.UTF-8";

  services.cloudflare-warp.enable = true;

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
      plymouth.enable = true;
    };

    hardware = {
      graphics.enable = true;
      pipewire.enable = true;
    };

    programs = {
      direnv.enable = true;
      gaming.enable = true;
    };
    virtualization = {
      virt-manager.enable = true;
      distrobox.enable = true;
      podman.enable = true;
    };

    desktop.niri.enable = true;
  };

  services.flatpak.enable = true;

  qt.enable = true;

  programs.gnupg.agent.enable = true;

  networking.hostId = "f9bd4f45";

  users.users.kareem = {
    enable = true;
    extraGroups = ["wheel" "libvirtd"];
  };

  networking.networkmanager.enable = true;
  # networking = {
  #   # networkmanager = {
  #   #   enable = true;
  #   #   wifi.backend = "iwd";
  #   # };
  #   wireless.iwd = {
  #     enable = true;
  #     settings = {
  #       Network = {
  #         EnableIPv6 = true;
  #         NameResolvingService = "systemd";
  #         EnableNetworkConfiguration = false;
  #       };
  #       Settings = {
  #         AutoConnect = true;
  #       };
  #     };
  #   };
  # };
  #
  # systemd.network.enable = true;
  # networking.useNetworkd = true;

  # systemd.network.networks."10-wireless-dhcp" = {
  #   matchConfig.Name = "wlan0";
  #   networkConfig = {
  #     DHCP = "ipv4";
  #   };
  # };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = ["~."];
    fallbackDns = [
      "9.9.9.9"
      "149.112.112.112"
    ];
    dnsovertls = "true";
  };

  networking.nameservers = [
    "9.9.9.9"
    "149.112.112.112"
  ];

  environment.systemPackages = with pkgs; [
    cloudflare-warp
    p7zip-rar
    kdePackages.ark

    kdePackages.dolphin
    feh

    git
    wget
    wineWowPackages.stable
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
}
