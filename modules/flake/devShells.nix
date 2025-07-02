{
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    devShells = {
      default = pkgs.mkShell {
        packages = with pkgs; [
          helix
          nixd
          nil
          nixfmt-rfc-style
          npins
          self'.packages.knv.devMode # doesn't work :/
          (pkgs.writeShellApplication {
            name = "rebuild";
            runtimeInputs = with pkgs; [
              nh
            ];
            text = ''
              nh os switch . -a
            '';
          })
          (pkgs.writeShellApplication {
            name = "impure";
            text = ''
              NAME=$(uname -n)
              IMPURITY_PATH=$(pwd) sudo --preserve-env=IMPURITY_PATH nixos-rebuild switch --flake ".#$NAME-impure" --impure
            '';
          })
        ];
      };
    };
  };
}
