# c
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
          self'.packages.knv.devMode
          (pkgs.writeShellApplication {
            name = "rebuild";
            runtimeInputs = with pkgs; [
              nh
            ];
            text = ''
              sudo -l > /dev/null
              nh os switch .
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
