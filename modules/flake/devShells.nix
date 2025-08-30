{
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    devShells = {
      default = pkgs.mkShell {
        packages = with pkgs; [
          npins
          self'.packages.knv.devMode

          just
          fyi
        ];
      };
    };
  };
}
