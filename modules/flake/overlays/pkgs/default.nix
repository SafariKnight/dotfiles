_: pkgs: let
  inherit (pkgs) lib;
in
  builtins.readDir ./.
  |> lib.filterAttrs (_: v: v != "directory")
  |> builtins.attrNames
  |> builtins.filter (n: n != "default.nix")
  |> builtins.map (n: {
    name = builtins.baseNameOf n |> lib.removeSuffix ".nix";
    value = pkgs.callPackage ./${n} {};
  })
  |> lib.listToAttrs
