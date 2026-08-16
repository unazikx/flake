{
  zen,
  ...
}:

{
  zen.programs.gui.easy-effects = {
    description = ''
      used for sound perfecting
      especcialy on my ThinkpadT14
      just cool

      used old...gtk version
      cause qt isnt cool
    '';

    includes = [
      zen.custom.easy-effects
      zen.programs.gui.easy-effects.presets
    ];

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        services.easyeffects = {
          enable = true;
          package = pkgs._stable-prev.easyeffects;
        };
      };
  };
}
