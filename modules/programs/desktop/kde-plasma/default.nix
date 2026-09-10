{
  zen,
  ...
}:

{
  zen.programs.desktop.kde-plasma = {
    description = ''
      best desktop environment
      ye
    '';

    includes = [
      zen.miscellaneous.users.accounts
    ];

    nixos =
      {
        pkgs,
        ...
      }:
      {
        environment.systemPackages = [
          pkgs.kdePackages.ktorrent
        ];

        services = {
          desktopManager.plasma6.enable = true;
        };
      };
  };
}
