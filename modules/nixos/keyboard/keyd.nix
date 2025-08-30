{
  lib,
  config,
  ...
}: let
  cfg = config.modules.keyboard.keyd;
in {
  options = {
    modules.keyboard.keyd.enable = lib.mkEnableOption "Enable Keyd";
  };
  config = lib.mkIf cfg.enable {
    # modules.keyboard.keyd.enable = lib.mkDefault true;
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["*"];
          settings = {
            main = {
              capslock = "overload(nav, esc)";

              # shift = "oneshot(shift)";
              # meta = "oneshot(meta)";
              # control = "oneshot(control)";

              # leftalt = "oneshot(alt)";
              # rightalt = "oneshot(altgr)";

              # esc = "noop"; # I have this so I can get in the habit of pressing capslock over escape # I got in the habit

              # a = "overloadt(meta, a, 175)";
              # s = "overloadt(alt, s, 175)";
              # d = "overloadt(shift, d, 175)";
              # f = "overloadt(control, f, 175)";
              #
              # k = "overloadt(control, k, 175)";
              # l = "overloadt(shift, l, 175)";
              # ";" = "overloadt(alt, ;, 175)";
              # "'" = "overloadt(meta, ', 175)";
            };
            # "nav:C" = {
            #   d = "layer(shift)";
            #   f = "layer(control)";
            #
            #   h = "left";
            #   j = "down";
            #   k = "up";
            #   l = "right";
            #
            #   semicolon = "backspace";
            #   p = "delete";
            # };

            # Colemak CAWS
            "nav:C" = {
              d = "layer(shift)";
              f = "layer(control)";

              j = "left";
              k = "down";
              l = "up";
              semicolon = "right";

              "'" = "backspace";
              leftbrace = "delete";
            };
          };
        };
      };
    };
  };
}
