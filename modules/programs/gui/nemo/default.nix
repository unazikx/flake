# INFO:
# best gui file manaager

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
          hmPackages = [
            pkgs.nemo
          ];

          hm.dconf.settings = {
            "org/nemo/icon-view" = {
              default-zoom-level = "larger";
              captions = [
                "none"
                "none"
                "none"
              ];
            };

            "org/nemo/window-state" = {
              network-expanded = false;
              start-with-menu-bar = false;
              start-with-sidebar = true;
              start-with-status-bar = false;
              sidebar-width = 230;
            };

            "org/nemo/preferences" = {
              disable-menu-warning = true;
              show-computer-icon-toolbar = true;
              show-edit-icon-toolbar = false;
              show-home-icon-toolbar = true;
              show-list-view-icon-toolbar = false;
              show-next-icon-toolbar = false;
              show-previous-icon-toolbar = false;
              show-search-icon-toolbar = false;
              show-up-icon-toolbar = false;
              thumbnail-limit = "2147483648";
            };
          };
        };
    };
}
