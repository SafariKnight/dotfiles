{
  perSystem = _: {
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        alejandra.enable = true;
        statix.enable = true;
        deadnix.enable = true;
        kdlfmt.enable = true;
        fish_indent.enable = true;
        shfmt.enable = true;
      };
    };
  };
}
