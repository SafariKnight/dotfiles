{pkgs, ...}: let
  pureDir = dir: ./files/${dir};
  # impureDir = dir: "{{home}}/dotfiles/modules/maid/kareem/files/${dir}";

  pure = dir: {source = pureDir dir;};
  # impure = dir: { source = impureDir dir; };

  inherit (pkgs.mpvScripts) uosc;
  inherit (pkgs.mpvScripts) thumbfast;
in {
  packages = with pkgs; [
    mpv
  ];
  file.xdg_config = {
    "mpv/mpv.conf" = pure "mpv/mpv.conf";
    "mpv/script-opts" = pure "mpv/script-opts";

    # uosc
    "mpv/scripts/uosc".source = "${uosc}/share/mpv/scripts/uosc";
    "mpv/fonts/uosc_icons.otf".source = "${uosc}/share/fonts/uosc_icons.otf";
    "mpv/fonts/uosc_textures.ttf".source = "${uosc}/share/fonts/uosc_textures.ttf";

    # thumbfast
    "mpv/scripts/thumbfast.lua".source = "${thumbfast}/share/mpv/scripts/thumbfast.lua";
  };
}
