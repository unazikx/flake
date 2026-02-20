{
  flake =
    {
      partsConfig,
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          ...
        }:
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              clipboard
              dunst
              hyprlock
              kitty
              niri
              tofi
              waybar
              wleave
              wob
              xdg
              ;
          };
        };
    };
}
