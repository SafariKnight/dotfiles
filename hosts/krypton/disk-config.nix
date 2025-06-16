{
  disko.devices = {
    disk.root = {
      device = "/dev/disk/by-id/ata-CT240BX500SSD1_2125E5B02290";
      type = "disk";

      content = {
        type = "gpt";

        partitions = {
          efi = {
            label = "NixOS Boot";
            type = "EF00"; # EFI System Partition
            size = "1G";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = ["umask=0077"];
            };
          };

          swap = {
            label = "Linux Swap";
            size = "16G"; # Good for hibernation (resumeDevice = true)
            content = {
              type = "swap";
              discardPolicy = "both"; # Enable TRIM for SSD
              resumeDevice = true; # Allow hibernation
            };
          };

          root = {
            label = "NixOS Root";
            size = "100%"; # Use remaining disk space
            content = {
              type = "zfs";
              pool = "zroot";
            };
          };
        };
      };
    };

    zpool = {
      zroot = {
        type = "zpool";
        options = {
          cachefile = "none"; # Don't use a cache file for pool metadata
          ashift = "12"; # Optimal block size for modern drives (4K physical sectors)
        };

        rootFsOptions = {
          acltype = "posixacl"; # Enable POSIX ACLs
          atime = "off"; # Disable access time updates for performance
          compression = "zstd"; # Excellent compression algorithm
          mountpoint = "none"; # Root pool won't be mounted directly
          xattr = "sa"; # Store extended attributes more efficiently
        };

        datasets = {
          # Parent datasets for organizational purposes; mountpoint="none"
          local = {
            type = "zfs_fs";
            options.mountpoint = "none";
          };
          safe = {
            type = "zfs_fs";
            options.mountpoint = "none";
          };

          # System-critical datasets (not typically auto-snapshotted)
          "local/root" = {
            type = "zfs_fs";
            mountpoint = "/";
            options = {
              mountpoint = "legacy"; # Managed by NixOS via fstab
              "com.sun:auto-snapshot" = "false";
            };
            postCreateHook = ''
              zfs list -t snapshot -H -o name | grep -E '^zroot/local/root@blank$' || zfs snapshot zroot/local/root@blank
            '';
          };
          "local/nix" = {
            type = "zfs_fs";
            mountpoint = "/nix";
            options = {
              atime = "off"; # Critical for /nix performance due to many small files
              canmount = "on";
              mountpoint = "legacy";
              recordsize = "16K"; # Optimized record size for small files in /nix/store
              "com.sun:auto-snapshot" = "false";
            };
          };
          "local/log" = {
            type = "zfs_fs";
            mountpoint = "/var/log";
            options = {
              mountpoint = "legacy";
              "com.sun:auto-snapshot" = "false";
            };
          };

          # User/persistent data datasets (auto-snapshotted)
          "safe/home" = {
            type = "zfs_fs";
            mountpoint = "/home";
            options = {
              mountpoint = "legacy";
              "com.sun:auto-snapshot" = "true";
            };
          };
          "safe/persistent" = {
            type = "zfs_fs";
            mountpoint = "/persistent";
            options = {
              mountpoint = "legacy";
              "com.sun:auto-snapshot" = "true";
            };
          };
        };
      };
    };
  };
}
