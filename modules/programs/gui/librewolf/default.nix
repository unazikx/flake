{
  zen,
  ...
}:

{
  zen.programs.gui.librewolf = {
    description = ''
      used for sound perfecting
      especcialy on my ThinkpadT14
      just cool

      used old...gtk version
      cause qt isnt cool
    '';

    includes = [
      zen.programs.gui.librewolf.bookmarks
      zen.programs.gui.librewolf.extensions
      zen.programs.gui.librewolf.policies
      zen.programs.gui.librewolf.profiles
      zen.programs.gui.librewolf.settings
    ];

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      {
        programs.librewolf = {
          enable = true;

          nativeMessagingHosts = lib.flatten [
            (lib.optionals config.programs.keepassxc.enable pkgs.keepassxc)
          ];
        };
      };
  };
}
