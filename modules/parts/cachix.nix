{
  ...
}:

{
  zen.flake-parts.default = {
    root =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        legacyPackages = {
          __cachix =
            let
              prefixes = [
                # keep-sorted start
                "cursors"
                "firefox-themes"
                "fonts"
                "minecraft-servers"
                "proton"
                "write-flake"
                "write-inputs"
                "write-lock"
                "yazi-plugins"
                # keep-sorted end
              ];
            in
            lib.filterAttrs (
              name: value:
              let
                prefix = lib.any (prefix: lib.hasPrefix prefix name) prefixes;
                localBuild = (value ? preferLocalBuild) && (value.preferLocalBuild == true);
              in
              !(prefix || localBuild)
            ) config.packages;

          __cachix-farmed = pkgs.linkFarm "cachix-packages" (
            builtins.mapAttrs (_name: drv: drv) config.legacyPackages.__cachix
          );

          __cachix-test = pkgs.linkFarm "all-cachix-packages" {
            inherit (config.packages)
              zaread
              hasher
              niri-sidebar
              ;
          };
        };
      };
  };
}
