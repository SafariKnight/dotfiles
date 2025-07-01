{
  pkgs,
  lib,
  inputs,
  config,
  impurity,
  ...
}: let
  inherit (impurity) link;
  userEnabled = config.modules.hjem.enable && config.users.users.kareem.enable;
in {
  imports = [
    ./mpv.nix
    ./tmux.nix
  ];

  config = {
    users.users.kareem = {
      isNormalUser = true;
    };

    hjem.users.kareem = {
      inherit (config.modules.hjem) enable; # shouldn't use userEnabled because hjem already checks if the user is enabled
      packages = with pkgs; [
        ripgrep
        bat
        fd
        fzf
        jujutsu
        jj-push
        wl-clipboard-rs
        kiwix
        discord-with-vencord
        stremio
        yazi

        # Rofi
        rofi-wayland

        # Quickshell
        inputs.quickshell.packages.${pkgs.system}.default

        # Niri
        xwayland-satellite
        xorg.setxkbmap

        # Helix
        helix
        nixd
        typescript
        typescript-language-server
        vscode-langservers-extracted
        emmet-language-server
        kdePackages.qtdeclarative

        # Ghostty
        ghostty

        # Kitty
        kitty

        # Fish
        fish
        zoxide
        oh-my-posh
        atuin
        eza
      ];

      files = {
        # Configs
        ".config/niri".source = link ./files/niri;
        ".config/helix".source = link ./files/helix;
        ".config/ghostty".source = link ./files/ghostty;
        ".config/kitty".source = link ./files/kitty;
        ".config/fish".source = link ./files/fish;
        ".config/jj".source = link ./files/jj;
        ".config/rofi".source = link ./files/rofi;
        ".config/oh-my-posh.json".source = link ./files/oh-my-posh/oh-my-posh.json;
        ".config/quickshell".source = link ./files/quickshell;

        # Other Stuff #
        # Cursor
        ".local/share/icons/default".source = "${pkgs.apple-cursor}/share/icons/macOS";

        # Fonts
        ".local/share/fonts/jetbrains".source = "${pkgs.jetbrains-mono}/share/fonts/truetype";
        ".local/share/fonts/adwaita-fonts".source = "${pkgs.adwaita-fonts}/share/fonts/Adwaita";
      };
    };

    programs.fish.enable = lib.mkDefault userEnabled;
  };
}
