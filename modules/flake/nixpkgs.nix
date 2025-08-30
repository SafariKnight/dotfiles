{inputs}: let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;
in
  system:
    import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };

      overlays =
        [
          (import ./overlays/pkgs)
        ]
        ++ (
          builtins.readDir ./overlays
          |> builtins.attrNames
          |> lib.filter (lib.hasSuffix ".nix")
          |> lib.map (n: import ./overlays/${n})
        );
    }
