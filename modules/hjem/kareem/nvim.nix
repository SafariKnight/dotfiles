{
  inputs,
  pkgs,
  ...
}:
inputs.mnw.lib.wrap {inherit pkgs inputs;} ./manual/mnw
