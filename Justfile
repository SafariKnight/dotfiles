default:
    just --list

switch flake="$(uname -n)": _sudo
  #!/usr/bin/env bash
  just _switch {{ flake }} &&
  fyi --icon=emblem-ok-symbolic --transient "NixOS Rebuild" "OK!" ||
  fyi --icon=window-close-symbolic --transient "NixOS Rebuild" "FAILED!"

impure flake="$(uname -n)": _sudo
  #!/usr/bin/env bash
  actual_flake="${flake%-impure}-impure"
  just _switch {{ flake }} &&
  fyi --icon=emblem-ok-symbolic --transient "NixOS Impure Rebuild" "OK!" ||
  fyi --icon=window-close-symbolic --transient "NixOS Impure Rebuild" "FAILED!"

test flake="$(uname -n)": _sudo
  #!/usr/bin/env bash
  just _test {{ flake }} &&
  fyi --icon=emblem-ok-symbolic --transient "NixOS Test" "OK!" ||
  fyi --icon=window-close-symbolic --transient "NixOS Test" "FAILED!"

update flake="$(uname -n)": _sudo
  #!/usr/bin/env bash
  just _update {{ flake }} &&
  fyi --icon=emblem-ok-symbolic --transient "NixOS Update" "OK!" ||
  fyi --icon=window-close-symbolic --transient "NixOS Update" "FAILED!"

@_sudo:
  sudo -l > /dev/null

_format:
  nix fmt &>/dev/null

_switch flake: _format
  nh os switch $(pwd) -H {{flake}}

_test flake: _format
  nh os test $(pwd) -H {{flake}}

_update flake: _format
  nix flake update
  sudo nixos-rebuild switch --flake .#{{flake}}
  nh os switch $(pwd) -H {{flake}} -u
