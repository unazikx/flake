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
              dunst
              foot
              i3status-rust
              sunsetr
              sway
              swayidle
              swaylock
              tofi
              wob
              # keep-sorted end
              ;
          };
        };
    };
}
