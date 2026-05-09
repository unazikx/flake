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
              dunst
              kitty
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
