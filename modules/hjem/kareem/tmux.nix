{pkgs, impurity, ...}: let
  inherit (impurity) link;
  minimal-tmux-status = pkgs.fetchFromGitHub {
    owner = "niksingh710";
    repo = "minimal-tmux-status";
    rev = "d7188c1aeb1c7dd03230982445b7360f5e230131";
    hash = "sha256-JtbuSxWFR94HiUdQL9uIm2V/kwGz0gbVbqvYWmEncbc=";
  };
in {
  hjem.users.kareem = {
    packages = with pkgs; [
      tmux
    ];
    files = {
      ".tmux.conf".source = link ./files/tmux/.tmux.conf;
      ".tmux/plugins/tmux-sensible".source = "${pkgs.tmuxPlugins.sensible}/share/tmux-plugins/sensible";
      ".tmux/plugins/minimal-tmux-status".source = minimal-tmux-status;
    };
  };
}
