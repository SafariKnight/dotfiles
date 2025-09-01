{
  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;
      imports = [
        ./modules/flake/nixosConfigurations.nix
        ./modules/flake/devShells.nix
        ./modules/flake/formatter.nix
        ./modules/flake/packages.nix
        inputs.treefmt-nix.flakeModule
      ];
    };

  inputs = {
    ## Nix Packages ##
    # nixpkgs.url = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable/nixexprs.tar.xz";
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

    ## Home Management ##
    hjem.url = "github:feel-co/hjem";
    impurity.url = "github:outfoxxed/impurity.nix";

    ## Flake Management
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    treefmt-nix.url = "github:numtide/treefmt-nix";

    ## System ##
    disko.url = "github:nix-community/disko/latest";

    ## Programs ##
    nix-index-database.url = "github:nix-community/nix-index-database";
    mnw.url = "github:Gerg-L/mnw";

    ## Overrides ##
    hjem.inputs.nixpkgs.follows = "nixpkgs";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };
}
