{
  ...
}:

{
  zen.hardware.boot.plymouth = {
    description = ''
      pretty screen on boot
    '';

    nixos =
      {
        pkgs,
        lib,
        ...
      }:
      {
        boot.plymouth = {
          enable = true;

          logo = lib.concatStringsSep "/" [
            pkgs.nixos-icons
            "share"
            "icons"
            "hicolor"
            "48x48"
            "apps"
            "nix-snowflake-white.png"
          ];
        };
      };
  };
}
