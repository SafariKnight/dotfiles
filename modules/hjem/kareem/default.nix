{
  pkgs,
  lib,
  inputs,
  config,
  impurity,
  ...
}: let
  userEnabled = config.modules.hjem.enable && config.users.users.kareem.enable;
  inherit (pkgs.mpvScripts) uosc thumbfast;
  zen-browser-beta = inputs.zen-browser.packages.${pkgs.system}.beta;
  mpvWithScripts = pkgs.mpv.override {
    scripts = [
      uosc
      thumbfast
    ];
  };
in {
  config = {
    users.users.kareem = {
      isNormalUser = true;
    };

    hjem.users.kareem = {
      inherit (config.modules.hjem) enable; # shouldn't use userEnabled because hjem already checks if the user is enabled
      packages = with pkgs; [
        ungoogled-chromium
        zen-browser-beta
        qbittorrent
        opencode
        mprocs

        gpu-screen-recorder
        gpu-screen-recorder-gtk

        discord-with-vencord
        stremio-mpv
        mpvWithScripts

        cloudflared
        tealdeer

        jetbrains.idea-community-bin
        jetbrains.phpstorm

        nodejs
        bun
        nodejs.pkgs.pnpm

        yaak

        # VCS
        git
        lazygit
        jujutsu
        jj-push
        lazyjj

        zed-editor-fhs

        zeal

        # Rofi
        rofi-wayland

        # TMux
        tmux
        tmux-session

        # Yazi
        yazi

        # Niri
        xwayland-satellite
        mako
        xorg.setxkbmap

        # Helix
        # inputs.helix-steel.packages.${pkgs.system}.default
        helix-wrapped
        steel
        nixd
        typescript
        typescript-language-server
        vscode-langservers-extracted
        emmet-language-server
        kdePackages.qtdeclarative

        # Ghostty
        ghostty

        # Fish
        fish
        nix-your-shell
        zoxide
        starship
        oh-my-posh
        atuin
        eza
        lsr
        ripgrep
        bat
        fd
        television

        emacs-pgtk

        # Neovim
        (import ./nvim.nix {inherit inputs pkgs;})
        wl-clipboard-rs
      ];

      files = import ./files.nix {inherit lib impurity config;};
    };

    programs.gpu-screen-recorder.enable = lib.mkDefault userEnabled;
    programs.fish.enable = lib.mkDefault userEnabled;
    programs.kdeconnect.enable = lib.mkDefault userEnabled;
  };
}
