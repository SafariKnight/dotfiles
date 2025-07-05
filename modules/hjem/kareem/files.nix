# Auto-detect and return an link-ready attrset of my home files
# It will link it in the same format in which it is created
# If it finds a .nix file it instead evaluates it and uses that
# as a target
{
  lib,
  impurity,
  config,
  ...
}: let
  inherit (builtins) toString;
  inherit (lib.attrsets) listToAttrs;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.lists) map;
  inherit (lib.strings) removePrefix hasSuffix removeSuffix;
  inherit (impurity) link;

  source = filepath:
    if (hasSuffix ".nix" filepath)
    then (import filepath config._module.args)
    else (link filepath);

  findFiles = directory: let
    directoryPrefix = (toString directory) + "/";
  in
    listToAttrs
    (map
      (filepath: let
        target = removePrefix directoryPrefix (toString filepath);

        finalTarget =
          if (hasSuffix ".nix" target)
          then (removeSuffix ".nix" target)
          else target;
      in {
        name = finalTarget;
        value.source = source filepath;
      })
      (listFilesRecursive directory));
in
  findFiles ./auto
