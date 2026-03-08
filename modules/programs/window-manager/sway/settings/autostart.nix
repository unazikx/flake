{
  pkgs,
  lib,
  ...
}:

let
  auto = command: always: {
    inherit
      command
      always
      ;
  };
in

[
  (auto "mako" false)
  (auto (lib.getExe pkgs.autotiling-rs) true)
]
