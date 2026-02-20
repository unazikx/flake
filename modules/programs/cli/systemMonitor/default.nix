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
            pkgs.nvtopPackages.amd
            pkgs.btop
          ];

          hm = {
            home.shellAliases = {
              btop = "btop";
              ntop = "nvtop -i";
            };

            programs.btop = {
              enable = true;

              settings = {
                update_ms = 100;
                theme_background = true;
                vim_keys = true;
                rounded_corners = true;
              };
            };
          };
        };
    };
}
