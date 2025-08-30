_: prev: let
  pkgs = prev;
in {
  helix-wrapped = pkgs.runCommand "helix-wrapped" {buildInputs = [pkgs.makeWrapper];} ''
    mkdir -p $out/bin
    makeWrapper ${pkgs.helix}/bin/hx $out/bin/hx \
      --prefix PATH : ${
      pkgs.lib.makeBinPath [
        pkgs.basedpyright
      ]
    }
  '';
}
