{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          partsConfig,
          ...
        }:
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              # keep-sorted start
              clipboard
              dunst
              foot
              hyprlock
              niri
              niri-bg
              niri-sidebar
              sunsetr
              tofi
              waybar
              wleave
              wob
              # keep-sorted end
              ;
          };
        };
    };
}
