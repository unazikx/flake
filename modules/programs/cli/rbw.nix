{
  ...
}:

{
  zen.programs.cli.rbw = {
    description = ''
      bitwarden cli client
      rbw-fzf is frontend for rbw
    '';

    homeManager =
      {
        inputs',
        pkgs,
        ...
      }:
      {
        home.packages = [
          inputs'.myown.legacyPackages.rbw-fzf
        ];

        programs.rbw = {
          enable = true;

          settings = {
            "email" = "xfalwa@gmail.com";
            "base_url" = "https://vaultwarden.servx.netcraze.club";
            "lock_timeout" = 60 * 30;
            "sync_interval" = 4;
            "pinentry" = pkgs.pinentry-gnome3;
          };
        };

        dbus.packages = [
          pkgs.gcr
        ];
      };
  };
}
