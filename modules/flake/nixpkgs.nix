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
      overlays = builtins.readDir ./overlays |> builtins.attrNames |> lib.map (n: import ./overlays/${n});
    }
