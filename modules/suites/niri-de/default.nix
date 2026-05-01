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
              hyprlock
              kitty
              niri
              niri-bg
              niri-sidebar
              sunsetr
              tofi
              waybar
              wleave
              wob
              xdg
              # keep-sorted end
              ;
          };
        };
    };
}
