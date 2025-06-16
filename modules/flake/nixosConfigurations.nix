{inputs, ...}: let
  initPkgs = system:
    import inputs.nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;

        packageOverrides = pkgs: {
          steam = pkgs.steam.override {
            extraPkgs = pkgs:
              with pkgs; [
                xorg.libXcursor
                xorg.libXi
                xorg.libXinerama
                xorg.libXScrnSaver
                libpng
                libpulseaudio
                libvorbis
                stdenv.cc.cc.lib
                libkrb5
                keyutils
              ];
          };
        };
      };
    };
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
            {
              nixpkgs.pkgs = initPkgs system;
            }
          ];
          specialArgs = {
            inherit inputs;
          };
        };
  in {
    nixosConfigurations = {
      krypton = mkSystem "x86_64-linux" "krypton";
    };
  };
}
