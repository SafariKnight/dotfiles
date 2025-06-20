{
  perSystem = {pkgs, ...}: {
    devShells = {
      default = pkgs.mkShell {
        packages = with pkgs; [
          helix
          nixd
          nil
          nixfmt-rfc-style
          (pkgs.writeShellApplication {
            name = "rebuild";
            runtimeInputs = with pkgs; [
              nh
            ];
            text = ''
              nh os switch . -a
            '';
          })
        ];
      };
    };
  };
}
