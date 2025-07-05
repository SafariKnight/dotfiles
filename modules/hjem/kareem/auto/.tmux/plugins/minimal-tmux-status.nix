{pkgs, ...}:
pkgs.fetchFromGitHub {
  owner = "niksingh710";
  repo = "minimal-tmux-status";
  rev = "d7188c1aeb1c7dd03230982445b7360f5e230131";
  hash = "sha256-JtbuSxWFR94HiUdQL9uIm2V/kwGz0gbVbqvYWmEncbc=";
}
