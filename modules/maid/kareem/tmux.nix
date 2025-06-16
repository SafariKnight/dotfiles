{pkgs, ...}: let
  pureDir = dir: ./files/${dir};
  # impureDir = dir: "{{home}}/dotfiles/modules/maid/kareem/files/${dir}";

  pure = dir: {source = pureDir dir;};
  minimal-tmux-status = pkgs.fetchFromGitHub {
    owner = "niksingh710";
    repo = "minimal-tmux-status";
    rev = "d7188c1aeb1c7dd03230982445b7360f5e230131";
    hash = "sha256-JtbuSxWFR94HiUdQL9uIm2V/kwGz0gbVbqvYWmEncbc=";
  };
  # impure = dir: { source = impureDir dir; };
in {
  packages = with pkgs; [
    tmux
  ];
  file.home = {
    ".tmux.conf" = pure "tmux/.tmux.conf";
    ".tmux/plugins/tmux-sensible".source = "${pkgs.tmuxPlugins.sensible}/share/tmux-plugins/sensible";
    ".tmux/plugins/minimal-tmux-status".source = minimal-tmux-status;
  };
}
