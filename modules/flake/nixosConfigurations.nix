{inputs, self, ...}: let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;
  initPkgs = (import ./nixpkgs.nix) {inherit inputs;};
in {
  # Sync the instance of pkgs between flake-parts and my systems
  perSystem = {system, ...}: {
    _module.args.pkgs = initPkgs system;
  };

  flake = let
    mkSystem = system: name:
      inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./../../hosts/${name}/configuration.nix
          ./../../hosts/${name}/hardware-configuration.nix
          ./../hjem
          {
            nixpkgs.pkgs = initPkgs system;
            nix = {
              channel.enable = false;
              registry = lib.mapAttrs (_: flake: {inherit flake;}) inputs;
              nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") inputs;
              settings = {
                nix-path = lib.mapAttrsToList (n: _: "${n}=flake:${n}") inputs;
                flake-registry = ""; # optional, ensures flakes are truly self-contained
              };
            };
          }
        ];
        specialArgs = {
          inherit inputs self;
        };
      };
  in {
    nixosConfigurations = {
      krypton = mkSystem "x86_64-linux" "krypton";
      krypton-impure = self.nixosConfigurations.krypton.extendModules
      { modules = [ { impurity.enable = true; }];};
    };
  };
}
