{
  pkgs,
  impurity,
  ...
}: let
  inherit (impurity) link;
  inherit (pkgs.mpvScripts) uosc thumbfast;
in {
  config = {
    hjem.users.kareem = {
      packages = with pkgs; [
        (mpv.override {
          scripts = [
            uosc
            thumbfast
          ];
        })
      ];
      files = {
        ".config/mpv".source = link ./files/mpv;
      };
    };
  };
}
