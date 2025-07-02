{
  pkgs,
  inputs,
  ...
}: let
  inherit (pkgs) lib;
  fs = lib.fileset;
in {
  neovim = pkgs.neovim-unwrapped;

  initLua = /* lua */''
    require("config")

    lz = require("lz.n")
    lz.load("plugins")

    require("lzn-auto-require").enable()
  '';

  aliases = [
    "vi"
    "vim"
    "nv"
  ];

  plugins = {
    dev.kareem = {
      pure = fs.toSource {
        root = ./.;
        fileset = fs.unions [
          ./lua
        ];
      };
      impure = "/home/kareem/dotfiles/modules/hjem/kareem/files/mnw";
    };

    start = inputs.mnw.lib.npinsToPlugins pkgs ./start.json;

    opt =
      [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      ]
      ++ inputs.mnw.lib.npinsToPlugins pkgs ./opt.json;
  };
}
