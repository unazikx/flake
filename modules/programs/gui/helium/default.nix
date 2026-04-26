# INFO:
# chromium based distro
# idk what say else

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          inputs,
          lib,
          ...
        }:
        {
          hm.programs.helium = {
            enable = true;

            extensions =
              let
                extensions-file = import (
                  lib.concatStringsSep "/" [
                    inputs.my-own-packages
                    "packages"
                    "helium-addons"
                    "output.nix.hidden"
                  ]
                );
              in
              lib.attrValues extensions-file;

            extraFlags = [ "--force-dark-mode" ];

            extraPolicies = {
              HomepageLocation = "https://start.duckduckgo.com";
              PasswordManagerEnabled = false;
              DeveloperToolsAvailability = 1;
              ManagedBookmarks = [
                {
                  toplevel_name = "Nix Ecosystem";
                }
                {
                  name = "Nix Packages";
                  url = "https://search.nixos.org/packages";
                }
              ];
            };

            preferences = {
              browser.show_home_button = true;
              bookmark_bar.show_on_all_tabs = true;
            };
          };
        };
    };
}
