{inputs, ...}: {
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    packages = {
      knv = import ../hjem/kareem/nvim.nix {inherit pkgs inputs;};
    };
  };
}
