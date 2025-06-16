{
  pkgs,
  inputs,
  ...
}: let
  pureDir = dir: ./files/${dir};
  impureDir = dir: "{{home}}/dotfiles/modules/maid/kareem/files/${dir}";

  pure = dir: {source = pureDir dir;};
  impure = dir: {source = impureDir dir;};
in {
  imports = [
    ./mpv.nix
    ./tmux.nix
  ];

  packages = with pkgs; [
    ripgrep
    bat
    fd
    fzf
    adwaita-fonts
    jujutsu
    wl-clipboard-rs

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
    nil
    typescript
    typescript-language-server
    vscode-langservers-extracted
    emmet-language-server
    kdePackages.qtdeclarative

    # Kitty
    kitty
    monaspace

    # Fish
    fish
    zoxide
    oh-my-posh
    atuin
    eza
  ];

  file = {
    xdg_config = {
      niri = impure "niri";
      helix = impure "helix";
      kitty = pure "kitty";
      fish = pure "fish";
      jj = pure "jj";
      rofi = impure "rofi";
      "oh-my-posh.json" = pure "oh-my-posh/oh-my-posh.json";
      quickshell = impure "quickshell";
    };

    home = {
      # Cursor
      ".local/share/icons/default".source = "${pkgs.apple-cursor}/share/icons/macOS";

      # Fonts
      ".local/share/fonts/jetbrains".source = "${pkgs.jetbrains-mono}/share/fonts/truetype";
      ".local/share/fonts/adwaita-fonts".source = "${pkgs.adwaita-fonts}/share/fonts/Adwaita";
    };
  };
}
