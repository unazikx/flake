{
  flake =
    {
      _config,
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
            inherit (_config.nixosModules)
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
