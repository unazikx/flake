# INFO:
# read manga/manhwa
# but i have suwayomi

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
          persist.user.directories = [
            ".local/share/komikku"
          ];

          hmPackages = [ pkgs.komikku ];

          hm.dconf.settings = {
            "info/febvre/Komikku" = {
              library-badges = [
                "unread-chapters"
                "downloaded-chapters"
                "recent-chapters"
              ];

              background-color = "gray";
              card-backdrop = true;
              downloader-state = true;
              library-servers-logo = true;
              nsfw-only-content = true;
              page-numbering = false;
              servers-languages = [ "ru" ];
              system-accent-colors = true;
            };
          };
        };
    };
}
