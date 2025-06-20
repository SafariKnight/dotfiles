{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  defaultConfig = name: {
    enable = lib.mkDefault false;
    isNormalUser = true;

    maid = {...}:
    # This has to be a function to use `imports` for whatever reason
    {
      imports = [
        ./${name}
      ];
      _module.args = {
        inherit inputs;
        pkgs = lib.mkForce pkgs;
        osConfig = config;
      };
    };
  };
in {
  imports = [
    inputs.nix-maid.nixosModules.default
  ];

  users.users.kareem = defaultConfig "kareem";
  programs.fish.enable = config.users.users.kareem.enable;
}
