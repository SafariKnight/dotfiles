{
  pkgs,
  inputs,
  ...
}: let
  inherit (pkgs) lib;
  fs = lib.fileset;
in {
  neovim = pkgs.neovim-unwrapped;

  initLua =
    /*
    lua
    */
    ''
      require("config")

      lz = require("lz.n")
      lz.load("plugins")

      require("lzn-auto-require").enable()
    '';

  aliases = [
    "vi"
    "vim"
  ];
  extraBinPath = with pkgs; [
    # Language Servers
    lua-language-server
    basedpyright
    nixd
    vscode-langservers-extracted
    tailwindcss-language-server
    vtsls
    nodejs.pkgs.typescript
    emmet-language-server
    svelte-language-server
    angular-language-server
    rust-analyzer

    ffmpeg-full
    imagemagick
  ];

  plugins = {
    dev.kareem = {
      pure = fs.toSource {
        root = ./.;
        fileset = fs.unions [
          ./lua
        ];
      };
      impure = "/home/kareem/dotfiles/modules/hjem/kareem/manual/mnw";
    };

    start = inputs.mnw.lib.npinsToPlugins pkgs ./start.json;

    opt =
      [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
        (pkgs.callPackage ./packages/blink-cmp.nix {})
      ]
      ++ inputs.mnw.lib.npinsToPlugins pkgs ./opt.json;
  };
}
