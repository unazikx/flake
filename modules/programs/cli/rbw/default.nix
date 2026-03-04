# INFO:
# bitwarden cli client
# rbw-fzf is frontend for rbw

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          ...
        }:
        {
          hmPackages = [ pkgs.own.rbw-fzf ];

          hm.programs.rbw = {
            enable = true;

            settings = {
              "email" = "xfalwa@gmail.com";
              "base_url" = "https://vault.vaultwarden.net";
              "lock_timeout" = 60 * 30;
              "sync_interval" = 4;
              "pinentry" = pkgs.pinentry-gnome3;
            };
          };
        };
    };
}
