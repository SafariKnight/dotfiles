{inputs}: let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;
in
  system:
    import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "qtwebengine-5.15.19"
        ];
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
