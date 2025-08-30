_final: prev: let
  pkgs = prev;

  patchedServer = pkgs.stdenv.mkDerivation rec {
    pname = "stremio-server-patched";
    version = "4.20.8";

    src = pkgs.fetchurl {
      url = "https://dl.strem.io/server/v${version}/desktop/server.js";
      hash = "sha256-cRMgD1d1yVj9FBvFAqgIqwDr+7U3maE8OrCsqExftHY=";
    };

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out

      cp $src $out/server.js

      ${pkgs.patch}/bin/patch -p1 -i ${./stremio-mpv.patch} $out/server.js
    '';

    meta.license = pkgs.lib.licenses.unfree;
  };
in {
  stremio-mpv = prev.stremio.overrideAttrs (oldAttrs: {
    server = patchedServer;
    postInstall =
      oldAttrs.postInstall
      +
      # bash
      ''
        rm $out/opt/stremio/server.js
        ln -s ${patchedServer}/server.js $out/opt/stremio/server.js
      '';
  });
}
