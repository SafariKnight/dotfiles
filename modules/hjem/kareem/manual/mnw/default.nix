{
  pkgs,
  inputs,
  ...
}:
let
  inherit (pkgs) lib;
  fs = lib.fileset;
in
{
  neovim = pkgs.neovim-unwrapped;

  initLua =
    # lua
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
    lua-language-server
    stylua

    basedpyright
    # pyright
    ruff

    nixd

    vscode-langservers-extracted
    tailwindcss-language-server
    nodejs.pkgs.typescript
    vtsls
    emmet-language-server
    svelte-language-server
    angular-language-server

    phpactor

    rust-analyzer
    # rust-analyzer.overrideAttrs(old: {
    #   src = pkgs.fetchFromGitHub {
    #     owner = "rust-lang";
    #     repo = "rust-analyzer";
    #     rev = "2025-08-11";
    #     hash = "sha256-fuHLsvM5z5/5ia3yL0/mr472wXnxSrtXECa+pspQchA=";
    #   };
    # })

    gopls
    gofumpt
    golines
    goimports-reviser

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

    opt = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      (pkgs.callPackage ./packages/blink-cmp.nix { })
    ]
    ++ inputs.mnw.lib.npinsToPlugins pkgs ./opt.json;
  };
}
