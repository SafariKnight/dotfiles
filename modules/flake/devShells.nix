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
            text = ''
              sudo nixos-rebuild switch --flake .
            '';
          })
        ];
      };
    };
  };
}
